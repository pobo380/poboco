# = Poboco - 2DGame Framework on DXRuby

module Poboco

  # === Overview
  # 画面上のコントロールが定義される名前空間.
  module Controls

    # === Overview
    # Poboco::Rectangleをクリック可能にするためのモジュール.
    # === Note
    # インスタンス変数@_clicked_, @_clicked_over_を予約します.
    # === Usage
    #  class ClickableExample
    #    include Poboco::Clickable
    #    def initialize
    #      @rect = Poboco::Rectangle.new(0, 0, 10, 50)
    #    end
    #
    #    def update
    #      update_clickable(@rect)
    #    end
    #  end
    module Clickable
      # === 引数
      # [rect] クリック可能な範囲を示すPoboco::Rectangle
      def update_clickable(rect)
        if rect.contain?(Point.new(Input.mousePosX, Input.mousePosY))
          if respond_to?(:on_over, true) and not @_clicked_over_
            on_over
            @_clicked_over_ = true
          end
          on_left_click  if Input.mousePush?(M_LBUTTON) and respond_to?(:on_left_click, true)
          on_right_click if Input.mousePush?(M_RBUTTON) and respond_to?(:on_right_click, true)
        else
          if respond_to?(:on_leave, true) and @_clicked_over_
            on_leave
            @_clicked_over_ = false
          end
        end
      end
    end

    # === Overview
    # Poboco::Rectangleをドラッグ可能にするためのモジュール.
    # === Note
    # インスタンス変数@_dragging_, @_dragging_prev_pos_を予約します.
    # === Usage
    #  class DraggableExample
    #    include Poboco::Draggable
    #    def initialize
    #      @rect = Poboco::Rectangle.new(0, 0, 10, 50)
    #    end
    #
    #    def update
    #      update_draggable(@rect, [M_LBUTTON])
    #    end
    #  end
    module Draggable
      # === 引数
      # [rect] ドラッグ可能な範囲を示すPoboco::Rectangle
      # [buttons] 判定を行うマウスボタンの配列. M_LBUTTON/M_RBUTTONが指定可能.
      def update_draggable(rect, buttons = [M_LBUTTON])
        if not @_dragging_ and rect.contain?(Point.new(Input.mousePosX, Input.mousePosY)) and buttons.any?{|b| Input.mousePush?(b) }
          @_dragging_ = true
          @_dragging_prev_pos_ = {:x => Input.mousePosX, :y => Input.mousePosY }
          on_start_dragging if respond_to?(:on_start_dragging, true)
        end
        if @_dragging_
          if buttons.any?{|b| Input.mouseDown?(b)}
            rect.pos.move!(Input.mousePosX - @_dragging_prev_pos_[:x], Input.mousePosY - @_dragging_prev_pos_[:y])
            @_dragging_prev_pos_ = {:x => Input.mousePosX, :y => Input.mousePosY }
          else
            @_dragging_ = false
            on_stop_dragging if respond_to?(:on_stop_dragging, true)
          end
        end
      end
    end

    # === Overview
    # 
    class Button
      include Clickable

      # === 引数
      # 
      def initialize(rect, sprite)
        @rect = rect
        @spr = sprite
        @over = false
      end

      def update
        update_clickable(@rect)
        @spr.update
      end

      def draw
        @spr.draw
      end

      # イベント時にコールバックされる.
      attr_accessor :on_over_event, :on_leave_event, :on_left_click_event, :on_right_click_event

      # イベント時に呼び出されるメソッドをコールバックにバインド.
    private
      def on_over
        @on_over_event.call unless @on_over_event.nil?
      end

      def on_leave
        @on_leave_event.call unless @on_leave_event.nil?
      end

      def on_left_click
        @on_left_click_event.call unless @on_left_click_event.nil?
      end

      def on_right_click
        @on_right_click_event.call unless @on_right_click_event.nil?
      end
    end

    # === Overview
    # 
    class DraggableButton < Button
      include Draggable

      def update
        update_draggable(@rect)
        super
      end

      # イベント時にコールバックされる.
      attr_accessor :on_stop_dragging_event, :on_start_dragging_event

    private
      def on_start_dragging
        @on_start_dragging_event.call unless @on_start_dragging_event.nil?
      end

      def on_stop_dragging
        @on_stop_dragging_event.call unless @on_stop_dragging_event.nil?
      end
    end
  end
end
