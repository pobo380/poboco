# = Poboco - 2DGame Framework on DXRuby

# === Overview
# Pobocoのトップレベルモジュール. すべてのクラス/モジュールは, この名前空間の中に定義される.
module Poboco
  
  # === Overview
  # トランジションクラス.
  # シーン遷移時の画面効果を記述する。
  # === Note
  #
  class Transition
    def initialize(duration)
      @duration = duration
      @finished = false
      @turned   = false
    end

    def update
    end

    def draw
    end

    def finished?
      @finished
    end

    def turned?
      @turned
    end

  protected
    def finished
      @finished = true
    end

    def turned
      @turned = true
    end
  end

  module BasicTransitions

    # 'duration' is not implemented yet
    class BlackFade < Transition
      def initialize(duration)
        @black_sprite = Poboco::Sprite.new(Poboco::Point.new(0, 0))
        @black_sprite.image = Image.new(Window.width, Window.height)
        @black_sprite.image.fill([255, 0, 0, 0])
        @black_sprite.image_alpha = 0
        @black_sprite.start_command([[:add_alpha, 15], [:wait, 1]])
        super(duration)
      end

      def update
        if @black_sprite.image_alpha == 255 and not self.turned?
          @black_sprite.start_command([[:add_alpha, -15], [:wait, 1]])
          turned
        elsif @black_sprite.image_alpha == 0 and self.turned?
          @black_sprite.start_command([[:wait, 1]])
          finished
        end
        DXRubyFw::Sprite.update([@black_sprite])
      end

      def draw
        Window.drawSprite([@black_sprite])
      end
    end

  end
end
