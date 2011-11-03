DXRubyFramework 0.0.3

■１．はじめに

 DXRubyFrameworkはDXRuby用の拡張ライブラリです。
 ゲームによく使いそうなロジックをCで実装し、手軽に高速に実行することを目標としています。
 Spriteと、オマケでMatrix、Vectorを提供しています。
 0.0.2以降は0.0.1とは互換性はありませんが、より使いやすく便利な方向に進化させたつもりです。


■２．特徴

 0.0.1より若干速度は低下していますが、正直言ってオーバースペックだったと思っています。
 逆に、0.0.1では機能が足りなくてどうしてもRubyで書かなければならなかったような動きも、コマンド列の導入により高速・簡単に実行することができるようになりました。
 キャラのアニメーション処理も柔軟に切り替えができるようになりました。
 混乱したメソッド体系を整理しました。


■３．基本的な使い方

 Sprite.newして各種パラメータを設定し、Window.drawSpriteで描画します。
 アニメーションや自動移動、コマンド実行などの処理はSprite#updateを毎フレーム呼び出すことで行います。
 チュートリアルのファイル(tutorial01.txtなど)も添付してありますので、そちらも併せてご覧ください。
 あと、全てのクラスはDXRubyFwモジュール下に定義されており、require時に自動でトップレベルにincludeします。
 require前に$dxrubyfw_no_include = trueと書いておくとincludeされません。
 バージョンはDXRubyFw::DXRUBYFW_VERSIONで確認できます。


■４．Windowモジュール

 Sprite描画用のメソッドを追加しています。

Window.drawSprite( sprite/array )
Window.draw_sprite( sprite/array )

 Spriteオブジェクトを渡すと、オブジェクトの画像を描画します。
 配列を渡すと配列内のSpriteオブジェクト全てを描画します。
 配列にSpriteオブジェクト以外のものが入っていた場合、drawメソッドが定義されているとそれが呼び出されます。
 この機能を使うとSprite以外のものもまとめて1つの配列で管理できます。


■５．Spriteクラス

 キャラの移動、アニメーション、衝突判定をCで実装しています。

◆クラスメソッド

Sprite.new
 Spriteオブジェクトを生成して返します。

Sprite.update( array )
 Spriteオブジェクトを入れた配列を渡すと、配列内の全てのオブジェクトのupdateメソッドを呼び出します。
 配列にSpriteオブジェクト以外のものが入っていた場合、updateメソッドが定義されているとそれが呼び出されます。
 この機能を使うとSprite以外のものもまとめて1つの配列で管理できます。

Sprite.check( array1, array2[, shot[, hit]] )
 Spriteオブジェクトのcollisionに設定された衝突判定範囲を用いて矩形衝突判定を行います。
 collisionがnilの場合は判定されません。
 delete?がtrueになっているオブジェクトも判定されません。
 arrayにSpriteオブジェクト単体を指定すると、単体のチェックができます。単体と配列のチェックもできます。
 衝突していた場合、第１引数のSpriteオブジェクトのshotメソッドと、第２引数のSpriteオブジェクトのhitメソッドが、それぞれ相手のオブジェクトを引数にして呼ばれます。
 array1とarray2に同じ配列を指定した場合は、一度判定したオブジェクトの判定と、自分同士の判定は省略されます。また、その場合、衝突したSpriteオブジェクトの両方のhitメソッドが呼ばれます。
 引数のshot、hitにシンボルを渡せば、それぞれ呼び出すメソッド名を変更することができます。

Sprite.clean( array )
 Spriteオブジェクトのdeleled?がtrueになっているものについて、配列から削除します。
 配列にSpriteオブジェクト以外のものが入っていた場合、deleted?メソッドが定義されているとそれが呼び出されます。
 この機能を使うとSprite以外のものもまとめて1つの配列で管理できます。

Sprite.global_dx
Sprite.global_dy
Sprite.global_dx=
Sprite.global_dy=
 Sprite.updateで移動する際に、global_dxとglobal_dyに設定された値が座標に足されます。


◆インスタンスメソッド（基本機能）

注意：クラスの中からでも、呼び出すときにはself.を付けるのをオススメします。

x
y
x=
y=
x_i
y_i
 xとyにはキャラの座標を入れます。
 x_iとy_iは座標を整数で取得するメソッドです。

z
z=
 DXRubyのWindow.draw系のz引数と同様の描画順を指定します。

dx
dy
dx=
dy=
speed
speed=
angle
angle=
 dxとdyに座標の増分を設定しておけば、Sprite#updateでそのぶんずつ移動させることができます。
 speedとangleでも、Sprite#updateでそのぶんずつ移動させることができます。
 dx/dy、speed/angleのセットのどちらか片方を設定すると、それに基づいた値にもう片方も自動的に変更されます。

visible
visible=(true/false)
 初期値はtrueで、trueにしておくとWindow.drawSpriteで描画されます。
 visibleがfalseの場合はWindow.drawSpriteしても描画されません。

deleted?
delete
 Spriteオブジェクトを消去する場合にdeleteを実行します。
 deleteを実行するとdeleted?がtrueを返すようになり、この状態だとSprite#updateもWindow.drawSpriteもSprite.checkも反応しなくなります。
 Sprite.cleanメソッドはdeleted?がtrueのオブジェクトを配列から除去します。

image
image=
 Window.drawSpriteで描画される画像データを設定します。

image_angle
image_angle=
image_scale_x
image_scale_x=
image_scale_y
image_scale_y=
image_alpha
image_alpha=
image_blend
image_blend=
 描画時に使用されるパラメータです。DXRubyのパラメータ指定と同様の指定ができます。
 現在の仕様では回転原点の指定はありません。
 image_blendにはBLEND_ALPHA、BLEND_ADD、BLEND_ADD2を指定できます。

param_hash
 上記image_xxxでの設定を、Window.drawExに渡すパラメータの形のハッシュで返します。

image_sync
image_sync=(true/false)
image_difference
image_difference=
 image_syncは初期値がfalseで、trueにするとSprite#angleの値とSprite#image_angleの値が同期するようになります。
 image_differenceは同期する際にSprite#angleとSprite#image_angleの差分を指定します。
 Sprite#angleは0で右に移動しますが、絵は右向きとは限らないからです。

image_turn
image_turn=
 毎フレームSprite#image_angleに加算される値を指定します。 Sprite#update時に反映されます。
 Sprite#image_syncがtrueの場合は無視されます。

update
 1フレーム分、内部の状態を進めます。
 座標の変更、アニメーション、コマンド再生はこのメソッドで行われます。
 Sprite.updateすると呼ばれます。

range
range=([x1, y1, x2, y2])
 移動可能範囲を設定します。
 キャラの座標がその範囲外になった場合に、該当オブジェクトのoutメソッドが呼び出されます。
 初期値はnilで、nilを指定すると範囲外チェックが解除されます。


◆インスタンスメソッド（アニメーション関連）

 Spriteクラスにはアニメーションを管理する機能があります。
 アニメーションに使う画像を配列で用意し、指定したフレーム数ごとに自動的に切り替えていくことができます。
 フレームのカウントはSprite#updateでされますので、これを呼び出さないとアニメーションしません。
 アニメーションが開始されていると、Sprite#update時にSprite#imageを該当する画像に勝手に変更します。

animation_image
animation_image=
 アニメーションに使うImageオブジェクトの配列を指定します。

add_animation(symbol, frame_count[, animation_pattern[, next]])
 アニメパターンを登録します。
 symbolはRubyのシンボルで、アニメパターンに名前を付けます。後でstart_animationでアニメーションを開始するときにこれで指定します。
 frame_countは絵を切り替えるフレーム数で、この回数Sprite#updateが呼ばれると次の絵に切り替わります。
 animation_patternはanimation_imageに指定した配列の要素番号を格納した配列となります。
 frame_countのみ指定すると配列の最初から最後まで順番にアニメーションし、最初に戻ります。
 nextはanimation_patternが最後まで終わったときに、次に開始されるアニメーションをシンボルで指定します。指定しないと同じアニメーションを最初から始めます。
 また、特殊機能として、nextにadd_animationで登録されていない名前を指定すると、アニメーション終了時にその名前のメソッドを呼び出します。
 これを使うと、例えばアニメーション完了時に:deleteを呼んでオブジェクトを削除する、などが可能になります。爆発の絵などに使うと便利です。

start_animation(symbol/frame_count[, animation_pattern[, next]])
 アニメーションを開始します。
 symbolを指定すると、add_animationで追加したアニメパターンでアニメーションが開始されます。名前が無い場合は無視されます。
 frame_count、animation_pattern、nexyの指定はadd_animationと同じ指定方法となります。登録していなくても直接アニメーションを開始することができます。
 start_animationは常にアニメーションの最初からスタートします。

change_animation(symbol/frame_count[, animation_pattern[, next]])
 start_animationと同じですが、フレームカウントを保持したまま切り替えます。

pause_animation
 アニメーションを一時停止します。

resume_animation
 一時停止したアニメーションを再開します。


◆インスタンスメソッド（衝突判定関連）

collision
collision=([x1, y1, x2, y2])
collision_enable
collision_enable=(true/false)
 collision=には衝突判定範囲を[x1, y1, x2, y2]の配列で指定します。
 キャラの原点(描画座標)からの相対位置です。
 これが設定されていてcollision_enableがtrueのSpriteオブジェクトのみ、Sprite.checkで衝突判定されます。
 collision_enableの初期値はtrueです。


◆インスタンスメソッド（コマンド関連）

 ある意味、DXRubyFramework最大の変な機能であり、目玉機能です。
 キャラの移動パターンをコマンド化し、Sprite#update時に自動で移動させることができます。
 基本コマンドのみの利用であればCで全て処理されるので、Rubyで書くより遥かに高速に動作します。

start_command(commands)
 コマンド配列を渡して、実行を開始します。
 コマンド配列は、[[コマンドシンボル, パラメータ, ...], [コマンドシンボル, パラメータ, ...], ...]という配列です。
 最後まで行くとまた最初から実行されます。
 また、コマンドシンボルに基本コマンド以外のシンボルを設定すると、パラメータを引数にしたそのメソッドが呼ばれます。これを利用すると基本コマンドにない機能を自分で作り出すことができます。
 基本コマンドして、以下のものが実装されています。()の中はパラメータです。

:wait(count)
 countフレームだけコマンドの実行を停止します。-1を指定すると実質無限に停止します。

:set_x(x)/set_y(y)
 指定の座標に移動します。

:set_dx(dx)/set_dy(dy)/set_speed(speed)/set_angle(angle)
 移動の増分を指定します。

:rotate(angle)
 angleをSprite#angleに加算します。

:rotate_image(angle)
 angleをSprite#image_angleに加算します。

:accel(speed)
 speedをSprite#speedに加算します。

:add_dx(dx)/add_dy(dy)
 dx/dyをSprite#dx/dyに加算します。

:add_alpha(alpha)
 alphaをSprite#alphaに加算します。

:delete
 deleteを実行します。

:call_command(commands)
 commandsに指定したコマンド配列にコマンドの実行を切り替えます。


◆コールバックメソッド

out
 rangeで移動可能範囲を設定した場合に、移動可能範囲から出たら呼ばれます。

shot(d)/hit(o)
 Sprite.checkの衝突判定で当たっていた場合に、それぞれ相手のオブジェクトを引数に呼び出されます。


◆特殊機能

call_update_flag
call_update_flag=
 初期値はtrueで、trueの場合はSprite.update時にupdateメソッドが呼ばれます。
 falseにするとupdateメソッドを呼ばず、座標の変更、アニメーション、コマンド再生を内部で行います。
 updateメソッドに自分で処理を書かない場合はfalseにしておくと動作が速くなります。

call_draw_flag
call_draw_flag=
 初期値はfalseで、trueの場合はWindow.drawSprite時にdrawメソッドが呼ばれます。
 特殊な描画をしたい場合にこのフラグをtrueにして、drawメソッドを定義してください。
 draw内でsuperを呼べば本来の描画もできます。よってSprite#drawも定義されており呼ぶと描画できますが、基本はWindow.drawSpriteで描画するようにしてください。


■６．Matrixクラス

 主に2D処理用のメソッドと基本的な行列演算を用意しています。
 4*4までの行列を扱うことができますが、2D用を主な用途としていますので3*3行列を扱うメソッドがほとんどとなっています。

◆クラスメソッド

Marix.new(m)
 行列を生成します。
 mは行列に設定する値を4*4の2次元配列もしくは4つまでの配列で指定します。
 引数を省略すると3*3の単位行列が生成されます。

Matrix.create_rotation(angle)
 angleは360度系で、3*3の回転行列を生成して返します。
 この行列をVectorオブジェクトに*メソッドで乗算すると、座標(0,0)を原点にした回転を行ったVectorオブジェクトが生成されます。

Matrix.create_translation(x, y)
 3*3の平行移動行列を生成して返します。
 この行列をVectorオブジェクトに*メソッドで乗算すると、Vectorの値に(x, y)を加算した結果のVectorオブジェクトが生成されます。

Matrix.create_scaling(sx, sy)
 3*3のスケーリング行列を生成して返します。
 この行列をVectorオブジェクトに*メソッドで乗算すると、Vectorの値に(x, y)を乗算した結果のVectorオブジェクトが生成されます。


◆インスタンスメソッド

*(matrix)
 selfに対してmarixを右から乗算します。
 移動行列*回転行列とすると、移動してから回転する行列ができあがります。

to_s
 selfの中身を文字列に変換します。


■７．Vectorクラス

 ベクトルを表すクラスです。
 4つまでの要素を扱え、基本的なベクトル演算を行うことができます。

◆クラスメソッド

Vector.new(s1, s2 = 0, s3 = 0, s4 = 0)
 4要素までのベクトルを生成します。
 xに配列を渡すと、その配列の内容を展開します。

Vector.innerProduct(v1, v2)
 v1とv2の内積を返します。

Vector.crossProduct(v1, v2)
 v1とv2の外積を返します。

Vector.distance(v1, v2)
 v1とv2の距離を返します。


◆インスタンスメソッド

*(arg)
 argにはNumetic、Matrix、Vectorのいずれかを渡します。
 Numericを渡した場合、selfをarg倍した新しいVectorを返します。
 Matrixを渡した場合、selfに対してmatを乗算します。selfがmatされた後の値のベクトルが返ります。
 Vectorを渡した場合、対応する要素同士を乗算した新しいVectorを返します。

/(numeric/vector)
 Numericを渡した場合、selfを1/numericした新しいVectorを返します。
 Vectorを渡した場合、対応する要素同士で除算した新しいVectorを返します。

+(numeric/vector)
 Numericを渡した場合、selfの全ての要素にnumericを加算した新しいVectorを返します。
 Vectorを渡した場合、対応する要素を加算した新しいVectorを返します。

-(vector)
 Numericを渡した場合、selfの全ての要素からnumericを減算した新しいVectorを返します。
 Vectorを渡した場合、対応する要素を減算した新しいVectorを返します。

-@
 単項式の-です。
 selfのすべての要素に-1をかけた結果を返します。

size
 selfの要素数を返します。

normalize
 selfを正規化した結果を返します。

x
y
z
w
 それぞれ、一つ目、二つ目、三つ目、四つ目の要素の値が返ります。
 immutableオブジェクトなので代入はありません。

to_s
 selfの中身を文字列に変換します。


■８．ライセンス

 DXRubyFramework0.0.3はzlib/libpngライセンスを適用します。
 同梱しているサンプルはパブリックドメインとします。
 画像は水視アズマ氏に描いていただいたもので、GPLです。


■９．更新履歴

2010/07/03 0.0.3 updateメソッドを呼ばずに内部で完結させるSprite#call_update_flag追加。
                 update時にやっていた衝突判定範囲の更新をSprite.check時にやるように変更。
                 Window.drawSprite時にdrawメソッドを呼ばすためのSprite#call_draw_flag追加。
                 Sprite#param_hash追加。DXRubyFwモジュール下に全てのクラスを定義するよう修正。
                 Matrix/Vector追加。

2010/06/27 0.0.2 公開。


組み込まれているRuby。
http://www.ruby-lang.org/ja/

DXRuby
http://dxruby.sourceforge.jp/

