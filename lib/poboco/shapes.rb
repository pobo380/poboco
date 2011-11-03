# = Poboco - 2DGame Framework on DXRuby

require 'forwardable'
require 'delegate'
require 'poboco/util'

# === Overview
# Pobocoのトップレベルモジュール. すべてのクラス/モジュールは, この名前空間の中に定義される.
module Poboco
    
  # === Overview
  # 2次元座標の位置(点)を表すクラス.
  # 親座標からの相対座標で表され,  親座標を持たない場合は絶対座標とみなされる.
  # === Note
  # mutableに振舞います.
  # 循環参照の可能性があるため注意してください。
  class Point
    # [x] x座標
    # [y] y座標
    # [parent] 親座標. nilなら絶対座標
    def initialize(x, y, parent=nil)
      @x = Float.induced_from(x)
      @y = Float.induced_from(y)
      @parent = parent
    end

    # x, y座標の配列を得る.
    def xy
      [x, y]
    end

    # x, y座標をdx, dy分だけ移動した新しいPointを得る.
    def move(dx, dy)
      Point.new(@x + dx, @y + dy, @parent)
    end

    # x, y座標を変更した新しいPointを得る.
    def move_to(x, y)
      Point.new(x, y, @parent)
    end

    # x, y座標をdx, dy分だけ移動する.
    # 副作用あり
    def move!(dx, dy)
      @x = @x + dx
      @y = @y + dy
      self
    end

    # x, y座標の変更.
    # 副作用あり
    def move_to!(x, y)
      @x = x
      @y = y
      self
    end

    # 位置の比較
    def ==(vec)
      @x == vec.x and @y == vec.y
    end

    # 位置の加算
    def +(vec)
      self.class.new(@x + vec.x, @y + vec.y)
    end

    # 位置の減算
    def -(vec)
      self.class.new(@x - vec.x, @y - vec.y)
    end

    # 副作用のある加算
    def plus!(vec)
      @x += vec.x
      @y += vec.y
      self
    end

    # 副作用のある減算
    def minus!(vec)
      @x -= vec.x
      @y -= vec.y
      self
    end

    # 絶対座標を計算
    def absolute
      unless @parent.nil?
        @parent.absolute.plus!(self)
      else
        Origin + self
      end
    end

    # 絶対座標であるかどうか
    def absolute?
      @parent.nil?
    end

    # 自身の親座標を設定
    def child_of(parent)
      @parent = parent
      self
    end

    # 自身を親座標として設定
    def parent_of(child)
      child.child_of(self)
      self
    end

    # 親座標
    attr_reader :parent
    attr_accessor :x, :y

    # 原点を表すPointクラス
    Origin = Point.new(0, 0)
  end

  # === Overview
  # 2次元座標上の矩形を表すクラス.
  # === Note
  #
  class Rectangle
    extend Forwardable
    extend Util::Filterable

    # ==== Poboco::Pointオブジェクトによって初期化を行う
    # [pos] 左上の座標を示すPoboco::Point
    # [size] 矩形の大きさを示すPoboco::Point
    # ==== x/y座標, 幅, 高さ によって初期化を行う
    # [x] 矩形の左上x座標.
    # [y] 矩形の左上y座標.
    # [w] 矩形の幅.
    # [h] 矩形の高さ.
    # [parent = nil] 親座標
    def initialize(*args)
      if args.size == 2
        @pos, @size = args
        @size.child_of(@pos)
      elsif args.size == 4 or args.size == 5
        x, y, w, h, parent = args
        @pos = Point.new(x, y, parent)
        @size = Point.new(w, h, @pos)
      else
        raise ArgumentError, "wrong number of arguments."
      end
      @corners = {
        :top_left =>     @pos,
        :top_right =>    Point.new(@pos.x + @size.x, @pos.y, @pos.parent),
        :bottom_left =>  Point.new(@pos.x, @pos.y + @size.y, @pos.parent),
        :bottom_right => Point.new(@pos.x + @size.x, @pos.y + @size.y, @pos.parent)
      }
    end

    # ある点/矩形を含んでいるかどうか.
    # ==== 引数
    # [pos_or_rect] 判定を行うPoboco::Point, Poboco::Rectangleオブジェクト
    def contain?(pos_or_rect)
      if pos_or_rect.kind_of?(Point)
        pos = pos_or_rect.absolute
        self_pos = @pos.absolute
        #p "@pos.x:#{@pos.x}, pos.x:#{pos.x}, @size.x:#{@size.x}"
        #p "@pos.y:#{@pos.y}, pos.y:#{pos.y}, @size.y:#{@size.y}"
        self_pos.x <= pos.x and pos.x <= self_pos.x + @size.x and self_pos.y <= pos.y and pos.y <= self_pos.y + @size.y
      elsif pos_or_rect.kind_of?(Rectangle)
        rect = pos_or_rect
        self_pos = @pos.absolute
        rect_pos = rect.pos.absolute
        self_pos.x <= rect_pos.x and self_pos.y <= rect_pos.y and rect_pos.x + rect.width <= self_pos.x + @size.x and rect_pos.y + rect.height <= self_pos.y + @size.y
      else
        raise TypeError, "expect type kind of Poboco::Point or Poboco::Rectangle."
      end
    end

    # ある矩形と交差しているかどうか.
    # ==== 引数
    # [rect] 判定を行うRectangleオブジェクト
    def intersect?(rect)
        self_pos = @pos.absolute
        rect_pos = rect.pos.absolute
        self_pos.x <= rect_pos.x + rect.width and self_pos.y <= rect_pos.y + rect.height and rect_pos.x <= self_pos.x + @size.x and rect_pos.y <= self_pos.y + @size.y
    end

    # サイズの変更時に再計算
    def size_changed
      @corners[:top_right].move_to!(@pos.x + @size.x, @pos.y)
      @corners[:bottom_left].move_to!(@pos.x, @pos.y + @size.y)
      @corners[:bottom_right].move_to!(@pos.x + @size.x, @pos.y + @size.y)
    end
    private :size_changed

    # 位置
    attr_reader :pos

    # 大きさ
    attr_reader :size

    def_delegators(:@pos, :x, :y, :x=, :y=)
    def_delegator(:@size, :x, :width)
    def_delegator(:@size, :y, :height)
    def_delegator(:@size, :x=, :width=)
    def_delegator(:@size, :y=, :height=)
    def_delegator(:@corners, :fetch, :corner)

    post_filter(:size_changed, :width=, :height=)
  end
end
