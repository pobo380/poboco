# = Poboco - 2DGame Framework on DXRuby
#
# Authors:: pobo380
# Version:: 0.1
# Lisence:: {NYSL}[http://www.kmonos.net/nysl/]に準拠
#
# === 概要
#
# Pobocoは, Ruby1.8とDXRubyを用いて作られた, 
# 2Dゲーム製作のためのゲームライブラリです.
# {Miyako}[http://www.twin.ne.jp/~cyross/Miyako/]をリスペクトしています.
#
# === 開発履歴
# * 2010-08-23 - 0.1
#   * 開発を立ち上げ.
#
#

require 'dxruby'

path = File.expand_path(File.dirname(__FILE__))

require path + '/dxrubyfw/dxrubyfw'

require path + '/poboco/shapes'
require path + '/poboco/sprite'
require path + '/poboco/scene'
require path + '/poboco/controls'
require path + '/poboco/transition'
require path + '/poboco/resources'

