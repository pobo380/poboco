# = Poboco - 2DGame Framework on DXRuby

module Poboco

  # === Overview
  # 繰り返し呼ばれる画面を定義するためのクラス.
  # === Note
  # 1フレーム毎に, Scene#update, Scene#drawが呼ばれる.
  # シーンがアクティブでない(Scene#activeがfalse)ならば, Scene#updateは呼ばれずScene#drawのみが呼ばれる.
  # === Usage
  # Scene#update, Scene#draw, Scene#init, Scene#quitを必要に応じてoverrideする.
  class Scene

    # シーンを開始する.
    # === Note
    # 内部でWindow.loopを行っている.
    def self.start(sceneclass, *args)
      scenes = []
      class << scenes
        def next(scene)
          self.last.active = false unless self.empty?
          scene.init
          self.push(scene)
        end
        def quit
          self.pop.quit
          self.last.active = true unless self.empty?
        end
        def exit
          self.each{|e| e.quit }
        end
      end

      scenes.next(sceneclass.new(*args))

      Window.loop do
        res = nil

        # シーンを実行
        scenes.each{|scene| res = scene.main }

        # トランジションを実行
        if not @current_transition.nil?
          if @current_transition.turned? and not @preload_scene.nil?
            scenes.quit
            scenes.next(@preload_scene)
            @preload_scene = nil
          end

          if @current_transition.finished?
            @current_transition = nil
          else
            @current_transition.update
            @current_transition.draw
          end
        end

        # シーン遷移の処理
        unless res.nil?
          next_flg, scene_class, scene_args = res

          case next_flg
            when :next, :fork
              if not scenes.last.transition_setting.nil? and next_flg == :next
                p "transition enable"
                transition_class, transition_args = scenes.last.transition_setting
                scenes.last.transition_setting = nil
                @current_transition = transition_class.new(*transition_args)
                @preload_scene = scene_class.new(*scene_args)
              else
                p "transition disable"
                scenes.quit if next_flg == :next
                scene = scene_class.new(*scene_args)
                scenes.next(scene)
              end
            when :quit
              scenes.quit
            when :exit
              break
            else
              # do nothing
          end
        end

        break if scenes.empty?
      end

      scenes.exit
    end

    # コンストラクタ.
    def initialize
      @active = true
      @visible = true
    end

    # デフォルトの1フレームごとに呼ばれる処理.
    def main
      @next_scene = nil
      self.update if @active
      self.draw if @visible
      @next_scene
    end

    # シーンの開始時に呼ばれるメソッド.
    def init
    end

    # シーンの終了時に呼ばれるメソッド.
    def quit
    end

    # シーンがアクティブであるかどうか. trueでアクティブ
    attr_accessor :active, :visible, :transition_setting

  private
    # 状態遷移を行うために呼ばれるメソッド.
    # Scene#drawの前に呼ばれる.
    # Overrideされるべき.
    def update
    end

    # 描画を行うために呼ばれるメソッド.
    # Scene#updateの後に呼ばれる.
    # Overrideされるべき.
    def draw
    end

    # 自身を終了し, 次のシーンへ遷移する.
    def next_scene(scene_class, *args)
      @next_scene = [:next, scene_class, args]
    end

    # 新しいシーンを開始する.
    def fork_scene(scene_class, *args)
      @next_scene = [:fork, scene_class, args]
    end

    # シーンを終了する.
    def quit_scene
      @next_scene = [:quit, nil, nil]
    end

    # シーン遷移を終了する.
    def exit_scene
      @next_scene = [:exit, nil, nil]
    end

    # トランジションを設定する
    def set_transition(transition_class, *args)
      @transition_setting = [transition_class, args]
    end

    # トランジション設定を消去する
    def clear_transition
      @transition_setting = nil
    end
  end
end
