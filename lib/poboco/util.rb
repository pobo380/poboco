# = Poboco - 2DGame Framework on DXRuby

module Poboco

  # === Poboco::Util
  # ユーティリティ群が定義されているモジュール
  module Util
    # === Overview
    # フィルタメソッド定義のためのモジュール.
    # メソッド呼び出しをフックして、別メソッドを事前/事後に呼び出すことが可能になる.
    #
    # === Note
    # 一つのメソッドに対して複数のプリフィルタ, または複数のポストフィルタを適用する事は出来ません.
    # メソッド呼び出し時に無限ループとなりスタックオーバーフローで停止します.
    #
    # === Usage
    # 利用したいクラスにFilterableをextendし, Filterable#pre_filter 又は Filterable#post_filterを呼び出す.
    #
    #  class Example
    #    extend Filterable
    #
    #    def foo
    #     print "foo"
    #    end
    #
    #    def bar
    #     print "bar"
    #    end
    #
    #    pre_filter :bar, :foo
    #  end
    #
    #  Example.new.foo # => "barfoo"
    #
    module Filterable
      # プリフィルタを設定する.
      # === 引数
      # [filter] フィルタメソッドのメソッド名Symbol
      # [*methods] フィルタリングされるメソッド名Symbolの配列
      def pre_filter(filter, *methods)
        filter = filter.id2name if filter.kind_of?(Integer)
        methods.map{|m| m.kind_of?(Integer) ? m.id2name : m }

        for method in methods
          module_eval(<<-EOS)
            alias :_prefiltered_#{method} :#{method}
            def #{method}(*args, &block)
              self.__send__(:#{filter})
              self.__send__(:_prefiltered_#{method}, *args, &block)
            end
          EOS
        end
      end

      # ポストフィルターを設定する.
      # === 引数
      # [filter] フィルタメソッドのメソッド名Symbol
      # [*methods] フィルタリングされるメソッド名Symbolの配列
      def post_filter(filter, *methods)
        filter = filter.id2name if filter.kind_of?(Integer)
        methods.map{|m| m.kind_of?(Integer) ? m.id2name : m }

        for method in methods
          module_eval(<<-EOS)
            alias :_postfiltered_#{method} :#{method}
            def #{method}(*args, &block)
              res = self.__send__(:_postfiltered_#{method}, *args, &block)
              self.__send__(:#{filter})
              res
            end
          EOS
        end
      end
    end
  end
end
