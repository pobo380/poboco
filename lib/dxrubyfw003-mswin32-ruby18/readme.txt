DXRubyFramework 0.0.3

���P�D�͂��߂�

 DXRubyFramework��DXRuby�p�̊g�����C�u�����ł��B
 �Q�[���ɂ悭�g�������ȃ��W�b�N��C�Ŏ������A��y�ɍ����Ɏ��s���邱�Ƃ�ڕW�Ƃ��Ă��܂��B
 Sprite�ƁA�I�}�P��Matrix�AVector��񋟂��Ă��܂��B
 0.0.2�ȍ~��0.0.1�Ƃ͌݊����͂���܂��񂪁A���g���₷���֗��ȕ����ɐi������������ł��B


���Q�D����

 0.0.1���኱���x�͒ቺ���Ă��܂����A���������ăI�[�o�[�X�y�b�N�������Ǝv���Ă��܂��B
 �t�ɁA0.0.1�ł͋@�\������Ȃ��Ăǂ����Ă�Ruby�ŏ����Ȃ���΂Ȃ�Ȃ������悤�ȓ������A�R�}���h��̓����ɂ�荂���E�ȒP�Ɏ��s���邱�Ƃ��ł���悤�ɂȂ�܂����B
 �L�����̃A�j���[�V�����������_��ɐ؂�ւ����ł���悤�ɂȂ�܂����B
 �����������\�b�h�̌n�𐮗����܂����B


���R�D��{�I�Ȏg����

 Sprite.new���Ċe��p�����[�^��ݒ肵�AWindow.drawSprite�ŕ`�悵�܂��B
 �A�j���[�V�����⎩���ړ��A�R�}���h���s�Ȃǂ̏�����Sprite#update�𖈃t���[���Ăяo�����Ƃōs���܂��B
 �`���[�g���A���̃t�@�C��(tutorial01.txt�Ȃ�)���Y�t���Ă���܂��̂ŁA������������Ă������������B
 ���ƁA�S�ẴN���X��DXRubyFw���W���[�����ɒ�`����Ă���Arequire���Ɏ����Ńg�b�v���x����include���܂��B
 require�O��$dxrubyfw_no_include = true�Ə����Ă�����include����܂���B
 �o�[�W������DXRubyFw::DXRUBYFW_VERSION�Ŋm�F�ł��܂��B


���S�DWindow���W���[��

 Sprite�`��p�̃��\�b�h��ǉ����Ă��܂��B

Window.drawSprite( sprite/array )
Window.draw_sprite( sprite/array )

 Sprite�I�u�W�F�N�g��n���ƁA�I�u�W�F�N�g�̉摜��`�悵�܂��B
 �z���n���Ɣz�����Sprite�I�u�W�F�N�g�S�Ă�`�悵�܂��B
 �z���Sprite�I�u�W�F�N�g�ȊO�̂��̂������Ă����ꍇ�Adraw���\�b�h����`����Ă���Ƃ��ꂪ�Ăяo����܂��B
 ���̋@�\���g����Sprite�ȊO�̂��̂��܂Ƃ߂�1�̔z��ŊǗ��ł��܂��B


���T�DSprite�N���X

 �L�����̈ړ��A�A�j���[�V�����A�Փ˔����C�Ŏ������Ă��܂��B

���N���X���\�b�h

Sprite.new
 Sprite�I�u�W�F�N�g�𐶐����ĕԂ��܂��B

Sprite.update( array )
 Sprite�I�u�W�F�N�g����ꂽ�z���n���ƁA�z����̑S�ẴI�u�W�F�N�g��update���\�b�h���Ăяo���܂��B
 �z���Sprite�I�u�W�F�N�g�ȊO�̂��̂������Ă����ꍇ�Aupdate���\�b�h����`����Ă���Ƃ��ꂪ�Ăяo����܂��B
 ���̋@�\���g����Sprite�ȊO�̂��̂��܂Ƃ߂�1�̔z��ŊǗ��ł��܂��B

Sprite.check( array1, array2[, shot[, hit]] )
 Sprite�I�u�W�F�N�g��collision�ɐݒ肳�ꂽ�Փ˔���͈͂�p���ċ�`�Փ˔�����s���܂��B
 collision��nil�̏ꍇ�͔��肳��܂���B
 delete?��true�ɂȂ��Ă���I�u�W�F�N�g�����肳��܂���B
 array��Sprite�I�u�W�F�N�g�P�̂��w�肷��ƁA�P�̂̃`�F�b�N���ł��܂��B�P�̂Ɣz��̃`�F�b�N���ł��܂��B
 �Փ˂��Ă����ꍇ�A��P������Sprite�I�u�W�F�N�g��shot���\�b�h�ƁA��Q������Sprite�I�u�W�F�N�g��hit���\�b�h���A���ꂼ�ꑊ��̃I�u�W�F�N�g�������ɂ��ČĂ΂�܂��B
 array1��array2�ɓ����z����w�肵���ꍇ�́A��x���肵���I�u�W�F�N�g�̔���ƁA�������m�̔���͏ȗ�����܂��B�܂��A���̏ꍇ�A�Փ˂���Sprite�I�u�W�F�N�g�̗�����hit���\�b�h���Ă΂�܂��B
 ������shot�Ahit�ɃV���{����n���΁A���ꂼ��Ăяo�����\�b�h����ύX���邱�Ƃ��ł��܂��B

Sprite.clean( array )
 Sprite�I�u�W�F�N�g��deleled?��true�ɂȂ��Ă�����̂ɂ��āA�z�񂩂�폜���܂��B
 �z���Sprite�I�u�W�F�N�g�ȊO�̂��̂������Ă����ꍇ�Adeleted?���\�b�h����`����Ă���Ƃ��ꂪ�Ăяo����܂��B
 ���̋@�\���g����Sprite�ȊO�̂��̂��܂Ƃ߂�1�̔z��ŊǗ��ł��܂��B

Sprite.global_dx
Sprite.global_dy
Sprite.global_dx=
Sprite.global_dy=
 Sprite.update�ňړ�����ۂɁAglobal_dx��global_dy�ɐݒ肳�ꂽ�l�����W�ɑ�����܂��B


���C���X�^���X���\�b�h�i��{�@�\�j

���ӁF�N���X�̒�����ł��A�Ăяo���Ƃ��ɂ�self.��t����̂��I�X�X�����܂��B

x
y
x=
y=
x_i
y_i
 x��y�ɂ̓L�����̍��W�����܂��B
 x_i��y_i�͍��W�𐮐��Ŏ擾���郁�\�b�h�ł��B

z
z=
 DXRuby��Window.draw�n��z�����Ɠ��l�̕`�揇���w�肵�܂��B

dx
dy
dx=
dy=
speed
speed=
angle
angle=
 dx��dy�ɍ��W�̑�����ݒ肵�Ă����΁ASprite#update�ł��̂Ԃ񂸂ړ������邱�Ƃ��ł��܂��B
 speed��angle�ł��ASprite#update�ł��̂Ԃ񂸂ړ������邱�Ƃ��ł��܂��B
 dx/dy�Aspeed/angle�̃Z�b�g�̂ǂ��炩�Е���ݒ肷��ƁA����Ɋ�Â����l�ɂ����Е��������I�ɕύX����܂��B

visible
visible=(true/false)
 �����l��true�ŁAtrue�ɂ��Ă�����Window.drawSprite�ŕ`�悳��܂��B
 visible��false�̏ꍇ��Window.drawSprite���Ă��`�悳��܂���B

deleted?
delete
 Sprite�I�u�W�F�N�g����������ꍇ��delete�����s���܂��B
 delete�����s�����deleted?��true��Ԃ��悤�ɂȂ�A���̏�Ԃ���Sprite#update��Window.drawSprite��Sprite.check���������Ȃ��Ȃ�܂��B
 Sprite.clean���\�b�h��deleted?��true�̃I�u�W�F�N�g��z�񂩂珜�����܂��B

image
image=
 Window.drawSprite�ŕ`�悳���摜�f�[�^��ݒ肵�܂��B

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
 �`�掞�Ɏg�p�����p�����[�^�ł��BDXRuby�̃p�����[�^�w��Ɠ��l�̎w�肪�ł��܂��B
 ���݂̎d�l�ł͉�]���_�̎w��͂���܂���B
 image_blend�ɂ�BLEND_ALPHA�ABLEND_ADD�ABLEND_ADD2���w��ł��܂��B

param_hash
 ��Limage_xxx�ł̐ݒ���AWindow.drawEx�ɓn���p�����[�^�̌`�̃n�b�V���ŕԂ��܂��B

image_sync
image_sync=(true/false)
image_difference
image_difference=
 image_sync�͏����l��false�ŁAtrue�ɂ����Sprite#angle�̒l��Sprite#image_angle�̒l����������悤�ɂȂ�܂��B
 image_difference�͓�������ۂ�Sprite#angle��Sprite#image_angle�̍������w�肵�܂��B
 Sprite#angle��0�ŉE�Ɉړ����܂����A�G�͉E�����Ƃ͌���Ȃ�����ł��B

image_turn
image_turn=
 ���t���[��Sprite#image_angle�ɉ��Z�����l���w�肵�܂��B Sprite#update���ɔ��f����܂��B
 Sprite#image_sync��true�̏ꍇ�͖�������܂��B

update
 1�t���[�����A�����̏�Ԃ�i�߂܂��B
 ���W�̕ύX�A�A�j���[�V�����A�R�}���h�Đ��͂��̃��\�b�h�ōs���܂��B
 Sprite.update����ƌĂ΂�܂��B

range
range=([x1, y1, x2, y2])
 �ړ��\�͈͂�ݒ肵�܂��B
 �L�����̍��W�����͈̔͊O�ɂȂ����ꍇ�ɁA�Y���I�u�W�F�N�g��out���\�b�h���Ăяo����܂��B
 �����l��nil�ŁAnil���w�肷��Ɣ͈͊O�`�F�b�N����������܂��B


���C���X�^���X���\�b�h�i�A�j���[�V�����֘A�j

 Sprite�N���X�ɂ̓A�j���[�V�������Ǘ�����@�\������܂��B
 �A�j���[�V�����Ɏg���摜��z��ŗp�ӂ��A�w�肵���t���[�������ƂɎ����I�ɐ؂�ւ��Ă������Ƃ��ł��܂��B
 �t���[���̃J�E���g��Sprite#update�ł���܂��̂ŁA������Ăяo���Ȃ��ƃA�j���[�V�������܂���B
 �A�j���[�V�������J�n����Ă���ƁASprite#update����Sprite#image���Y������摜�ɏ���ɕύX���܂��B

animation_image
animation_image=
 �A�j���[�V�����Ɏg��Image�I�u�W�F�N�g�̔z����w�肵�܂��B

add_animation(symbol, frame_count[, animation_pattern[, next]])
 �A�j���p�^�[����o�^���܂��B
 symbol��Ruby�̃V���{���ŁA�A�j���p�^�[���ɖ��O��t���܂��B���start_animation�ŃA�j���[�V�������J�n����Ƃ��ɂ���Ŏw�肵�܂��B
 frame_count�͊G��؂�ւ���t���[�����ŁA���̉�Sprite#update���Ă΂��Ǝ��̊G�ɐ؂�ւ��܂��B
 animation_pattern��animation_image�Ɏw�肵���z��̗v�f�ԍ����i�[�����z��ƂȂ�܂��B
 frame_count�̂ݎw�肷��Ɣz��̍ŏ�����Ō�܂ŏ��ԂɃA�j���[�V�������A�ŏ��ɖ߂�܂��B
 next��animation_pattern���Ō�܂ŏI������Ƃ��ɁA���ɊJ�n�����A�j���[�V�������V���{���Ŏw�肵�܂��B�w�肵�Ȃ��Ɠ����A�j���[�V�������ŏ�����n�߂܂��B
 �܂��A����@�\�Ƃ��āAnext��add_animation�œo�^����Ă��Ȃ����O���w�肷��ƁA�A�j���[�V�����I�����ɂ��̖��O�̃��\�b�h���Ăяo���܂��B
 ������g���ƁA�Ⴆ�΃A�j���[�V������������:delete���Ă�ŃI�u�W�F�N�g���폜����A�Ȃǂ��\�ɂȂ�܂��B�����̊G�ȂǂɎg���ƕ֗��ł��B

start_animation(symbol/frame_count[, animation_pattern[, next]])
 �A�j���[�V�������J�n���܂��B
 symbol���w�肷��ƁAadd_animation�Œǉ������A�j���p�^�[���ŃA�j���[�V�������J�n����܂��B���O�������ꍇ�͖�������܂��B
 frame_count�Aanimation_pattern�Anexy�̎w���add_animation�Ɠ����w����@�ƂȂ�܂��B�o�^���Ă��Ȃ��Ă����ڃA�j���[�V�������J�n���邱�Ƃ��ł��܂��B
 start_animation�͏�ɃA�j���[�V�����̍ŏ�����X�^�[�g���܂��B

change_animation(symbol/frame_count[, animation_pattern[, next]])
 start_animation�Ɠ����ł����A�t���[���J�E���g��ێ������܂ܐ؂�ւ��܂��B

pause_animation
 �A�j���[�V�������ꎞ��~���܂��B

resume_animation
 �ꎞ��~�����A�j���[�V�������ĊJ���܂��B


���C���X�^���X���\�b�h�i�Փ˔���֘A�j

collision
collision=([x1, y1, x2, y2])
collision_enable
collision_enable=(true/false)
 collision=�ɂ͏Փ˔���͈͂�[x1, y1, x2, y2]�̔z��Ŏw�肵�܂��B
 �L�����̌��_(�`����W)����̑��Έʒu�ł��B
 ���ꂪ�ݒ肳��Ă���collision_enable��true��Sprite�I�u�W�F�N�g�̂݁ASprite.check�ŏՓ˔��肳��܂��B
 collision_enable�̏����l��true�ł��B


���C���X�^���X���\�b�h�i�R�}���h�֘A�j

 ����Ӗ��ADXRubyFramework�ő�̕ςȋ@�\�ł���A�ڋʋ@�\�ł��B
 �L�����̈ړ��p�^�[�����R�}���h�����ASprite#update���Ɏ����ňړ������邱�Ƃ��ł��܂��B
 ��{�R�}���h�݂̗̂��p�ł����C�őS�ď��������̂ŁARuby�ŏ������y���ɍ����ɓ��삵�܂��B

start_command(commands)
 �R�}���h�z���n���āA���s���J�n���܂��B
 �R�}���h�z��́A[[�R�}���h�V���{��, �p�����[�^, ...], [�R�}���h�V���{��, �p�����[�^, ...], ...]�Ƃ����z��ł��B
 �Ō�܂ōs���Ƃ܂��ŏ�������s����܂��B
 �܂��A�R�}���h�V���{���Ɋ�{�R�}���h�ȊO�̃V���{����ݒ肷��ƁA�p�����[�^�������ɂ������̃��\�b�h���Ă΂�܂��B����𗘗p����Ɗ�{�R�}���h�ɂȂ��@�\�������ō��o�����Ƃ��ł��܂��B
 ��{�R�}���h���āA�ȉ��̂��̂���������Ă��܂��B()�̒��̓p�����[�^�ł��B

:wait(count)
 count�t���[�������R�}���h�̎��s���~���܂��B-1���w�肷��Ǝ��������ɒ�~���܂��B

:set_x(x)/set_y(y)
 �w��̍��W�Ɉړ����܂��B

:set_dx(dx)/set_dy(dy)/set_speed(speed)/set_angle(angle)
 �ړ��̑������w�肵�܂��B

:rotate(angle)
 angle��Sprite#angle�ɉ��Z���܂��B

:rotate_image(angle)
 angle��Sprite#image_angle�ɉ��Z���܂��B

:accel(speed)
 speed��Sprite#speed�ɉ��Z���܂��B

:add_dx(dx)/add_dy(dy)
 dx/dy��Sprite#dx/dy�ɉ��Z���܂��B

:add_alpha(alpha)
 alpha��Sprite#alpha�ɉ��Z���܂��B

:delete
 delete�����s���܂��B

:call_command(commands)
 commands�Ɏw�肵���R�}���h�z��ɃR�}���h�̎��s��؂�ւ��܂��B


���R�[���o�b�N���\�b�h

out
 range�ňړ��\�͈͂�ݒ肵���ꍇ�ɁA�ړ��\�͈͂���o����Ă΂�܂��B

shot(d)/hit(o)
 Sprite.check�̏Փ˔���œ������Ă����ꍇ�ɁA���ꂼ�ꑊ��̃I�u�W�F�N�g�������ɌĂяo����܂��B


������@�\

call_update_flag
call_update_flag=
 �����l��true�ŁAtrue�̏ꍇ��Sprite.update����update���\�b�h���Ă΂�܂��B
 false�ɂ����update���\�b�h���Ă΂��A���W�̕ύX�A�A�j���[�V�����A�R�}���h�Đ�������ōs���܂��B
 update���\�b�h�Ɏ����ŏ����������Ȃ��ꍇ��false�ɂ��Ă����Ɠ��삪�����Ȃ�܂��B

call_draw_flag
call_draw_flag=
 �����l��false�ŁAtrue�̏ꍇ��Window.drawSprite����draw���\�b�h���Ă΂�܂��B
 ����ȕ`����������ꍇ�ɂ��̃t���O��true�ɂ��āAdraw���\�b�h���`���Ă��������B
 draw����super���ĂׂΖ{���̕`����ł��܂��B�����Sprite#draw����`����Ă���ĂԂƕ`��ł��܂����A��{��Window.drawSprite�ŕ`�悷��悤�ɂ��Ă��������B


���U�DMatrix�N���X

 ���2D�����p�̃��\�b�h�Ɗ�{�I�ȍs�񉉎Z��p�ӂ��Ă��܂��B
 4*4�܂ł̍s����������Ƃ��ł��܂����A2D�p����ȗp�r�Ƃ��Ă��܂��̂�3*3�s����������\�b�h���قƂ�ǂƂȂ��Ă��܂��B

���N���X���\�b�h

Marix.new(m)
 �s��𐶐����܂��B
 m�͍s��ɐݒ肷��l��4*4��2�����z���������4�܂ł̔z��Ŏw�肵�܂��B
 �������ȗ������3*3�̒P�ʍs�񂪐�������܂��B

Matrix.create_rotation(angle)
 angle��360�x�n�ŁA3*3�̉�]�s��𐶐����ĕԂ��܂��B
 ���̍s���Vector�I�u�W�F�N�g��*���\�b�h�ŏ�Z����ƁA���W(0,0)�����_�ɂ�����]���s����Vector�I�u�W�F�N�g����������܂��B

Matrix.create_translation(x, y)
 3*3�̕��s�ړ��s��𐶐����ĕԂ��܂��B
 ���̍s���Vector�I�u�W�F�N�g��*���\�b�h�ŏ�Z����ƁAVector�̒l��(x, y)�����Z�������ʂ�Vector�I�u�W�F�N�g����������܂��B

Matrix.create_scaling(sx, sy)
 3*3�̃X�P�[�����O�s��𐶐����ĕԂ��܂��B
 ���̍s���Vector�I�u�W�F�N�g��*���\�b�h�ŏ�Z����ƁAVector�̒l��(x, y)����Z�������ʂ�Vector�I�u�W�F�N�g����������܂��B


���C���X�^���X���\�b�h

*(matrix)
 self�ɑ΂���marix���E�����Z���܂��B
 �ړ��s��*��]�s��Ƃ���ƁA�ړ����Ă����]����s�񂪂ł�������܂��B

to_s
 self�̒��g�𕶎���ɕϊ����܂��B


���V�DVector�N���X

 �x�N�g����\���N���X�ł��B
 4�܂ł̗v�f�������A��{�I�ȃx�N�g�����Z���s�����Ƃ��ł��܂��B

���N���X���\�b�h

Vector.new(s1, s2 = 0, s3 = 0, s4 = 0)
 4�v�f�܂ł̃x�N�g���𐶐����܂��B
 x�ɔz���n���ƁA���̔z��̓��e��W�J���܂��B

Vector.innerProduct(v1, v2)
 v1��v2�̓��ς�Ԃ��܂��B

Vector.crossProduct(v1, v2)
 v1��v2�̊O�ς�Ԃ��܂��B

Vector.distance(v1, v2)
 v1��v2�̋�����Ԃ��܂��B


���C���X�^���X���\�b�h

*(arg)
 arg�ɂ�Numetic�AMatrix�AVector�̂����ꂩ��n���܂��B
 Numeric��n�����ꍇ�Aself��arg�{�����V����Vector��Ԃ��܂��B
 Matrix��n�����ꍇ�Aself�ɑ΂���mat����Z���܂��Bself��mat���ꂽ��̒l�̃x�N�g�����Ԃ�܂��B
 Vector��n�����ꍇ�A�Ή�����v�f���m����Z�����V����Vector��Ԃ��܂��B

/(numeric/vector)
 Numeric��n�����ꍇ�Aself��1/numeric�����V����Vector��Ԃ��܂��B
 Vector��n�����ꍇ�A�Ή�����v�f���m�ŏ��Z�����V����Vector��Ԃ��܂��B

+(numeric/vector)
 Numeric��n�����ꍇ�Aself�̑S�Ă̗v�f��numeric�����Z�����V����Vector��Ԃ��܂��B
 Vector��n�����ꍇ�A�Ή�����v�f�����Z�����V����Vector��Ԃ��܂��B

-(vector)
 Numeric��n�����ꍇ�Aself�̑S�Ă̗v�f����numeric�����Z�����V����Vector��Ԃ��܂��B
 Vector��n�����ꍇ�A�Ή�����v�f�����Z�����V����Vector��Ԃ��܂��B

-@
 �P������-�ł��B
 self�̂��ׂĂ̗v�f��-1�����������ʂ�Ԃ��܂��B

size
 self�̗v�f����Ԃ��܂��B

normalize
 self�𐳋K���������ʂ�Ԃ��܂��B

x
y
z
w
 ���ꂼ��A��ځA��ځA�O�ځA�l�ڂ̗v�f�̒l���Ԃ�܂��B
 immutable�I�u�W�F�N�g�Ȃ̂ő���͂���܂���B

to_s
 self�̒��g�𕶎���ɕϊ����܂��B


���W�D���C�Z���X

 DXRubyFramework0.0.3��zlib/libpng���C�Z���X��K�p���܂��B
 �������Ă���T���v���̓p�u���b�N�h���C���Ƃ��܂��B
 �摜�͐����A�Y�}���ɕ`���Ă������������̂ŁAGPL�ł��B


���X�D�X�V����

2010/07/03 0.0.3 update���\�b�h���Ă΂��ɓ����Ŋ���������Sprite#call_update_flag�ǉ��B
                 update���ɂ���Ă����Փ˔���͈͂̍X�V��Sprite.check���ɂ��悤�ɕύX�B
                 Window.drawSprite����draw���\�b�h���Ă΂����߂�Sprite#call_draw_flag�ǉ��B
                 Sprite#param_hash�ǉ��BDXRubyFw���W���[�����ɑS�ẴN���X���`����悤�C���B
                 Matrix/Vector�ǉ��B

2010/06/27 0.0.2 ���J�B


�g�ݍ��܂�Ă���Ruby�B
http://www.ruby-lang.org/ja/

DXRuby
http://dxruby.sourceforge.jp/

