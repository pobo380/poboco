# = Poboco - 2DGame Framework on DXRuby

require 'singleton'

# === Overview
# Pobocoのトップレベルモジュール. すべてのクラス/モジュールは, この名前空間の中に定義される.
module Poboco

  # === Overview
  #
  class Resources
    include Singleton

    def initialize
      @fonts    = {}
      @sounds   = {}
      @graphics = {}
    end

    def sounds(key)
      return @sounds[key] unless @sounds[key].nil?
      ResourceLoader.new(lambda { |path, *args| @sounds[key] = Sound.new(path) })
    end

    def graphics(key)
      return @graphics[key] unless @graphics[key].nil?
      ResourceLoader.new(lambda { |path, *args| @graphics[key] = Image.load(path, *args) })
    end

    def fonts(key)
      return @fonts[key] unless @fonts[key].nil?
      ResourceLoader.new(lambda { |size, *args| @fonts[key] = Font.new(size, *args) })
    end

    def install_font(path)
      Font.install(path)
    end

    class << self
      def method_missing(action, *args)
        self.instance.send(action, *args)
      end
    end

    class ResourceLoader
      def initialize(f)
        @f = f
      end

      def load(path, *args)
        @f.call(path, *args)
      end
    end
  end
end

