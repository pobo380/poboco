# = Poboco - 2DGame Framework on DXRuby

require 'forwardable'
require 'delegate'

# === Overview
# Pobocoのトップレベルモジュール. すべてのクラス/モジュールは, この名前空間の中に定義される.
module Poboco

  # === Overview
  # 描画オブジェクトを表す.
  # DXRubyFrameworkのSpriteオブジェクトをラップしている.
  # 座標をPointで表すことの出来るDXRubyFw::Spriteである.
  # === Note
  # Sprite#update, Sprite#x, Sprite#x=, Sprite#y, Sprite#y=をoverrideしている.
  # その他は全てDXRubyFw::Spriteのメソッドである.
  #
  class Sprite < DelegateClass(DXRubyFw::Sprite)
    extend Forwardable

    # === 引数
    # [pos] 位置を表すPoboco::Pointオブジェクト
    def initialize(pos = Point.new(0, 0))
      super(DXRubyFw::Sprite.new)
      @pos = pos
      @spr = __getobj__
    end

    # 1フレーム毎の状態遷移を表す. DXRuby::Sprite.updateによって呼び出される.
    def update
      @spr.update
      @pos.x += @spr.dx
      @pos.y += @spr.dy
      @spr.x, @spr.y = @pos.absolute.xy
    end

    # imageのアルファ値を返す. DXRubyFramework 0.03のバグ対応.
    def image_alpha
      val = @spr.image_alpha
      val >= 0 ? val : val + 256
    end

    def image_alpha=(val)
      @spr.image_alpha = 
        if val > 255
          255
        elsif val < 0
          0
        else
          val
        end
    end

    # スプライトの位置を示すPointオブジェクト
    attr_accessor :pos

    # 委譲するメソッド群
    def_delegators(:@pos, :x, :y)
    def_delegators(:@pos, :x=, :y=)
  end
end
