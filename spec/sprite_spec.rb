require File.expand_path('../helper', __FILE__)

module Poboco
  # Test for Poboco::Sprite class
  describe 'Sprite:' do
    share_examples_for 'Sprite basic function' do
      it 'should have accessor :x, :y, :z, :dx, :dy, :speed, :angle.' do
        @spr.x = 1
        @spr.y = 1
        @spr.z = 1

        @spr.x.should == 1
        @spr.y.should == 1
        @spr.z.should == 1

        @spr.dx = 1
        @spr.dy = 1

        @spr.dx.should == 1
        @spr.dy.should == 1

        @spr.speed = 1
        @spr.angle = 1

        @spr.speed.should == 1
        @spr.angle.should == 1
      end

      it 'should have accessor :visible, :image, :image_angle, :image_scale_x, :image_scale_y, :image_alpha, :image_blend.' do
        img = Image.new(5, 5, [255, 255, 255, 0])

        @spr.visible = false
        @spr.image = img
        @spr.image_angle = 5
        @spr.image_scale_x = 5
        @spr.image_scale_y = 5
        @spr.image_alpha = 5
        @spr.image_blend = DXRubyFw::Sprite::BLEND_ADD1

        @spr.visible.should == false
        @spr.image.should == img
        @spr.image_angle.should == 5
        @spr.image_scale_x.should == 5
        @spr.image_scale_y.should == 5
        @spr.image_alpha.should == 5
        @spr.image_blend.should == DXRubyFw::Sprite::BLEND_ADD1
      end


      it 'should have accessor :image_sync, :image_difference, :image_turn.' do
        @spr.image_sync = true
        @spr.image_sync.should be_true

        @spr.image_difference = 5
        @spr.image_difference.should == 5

        @spr.image_turn = 5
        @spr.image_turn.should == 5
      end

      it 'should have reader :param_hash' do
        @spr.param_hash
      end
    end

    describe Poboco::Sprite, 'consctructed.' do
      before { @spr = Poboco::Sprite.new }

      it_should_behave_like 'Sprite basic function'

      it 'should have accessor :pos.' do
        @spr.pos = Point.new(5, 5)
        @spr.x.should == 5
        @spr.y.should == 5
      end
    end

    describe DXRubyFw::Sprite, 'consctructed.' do
      before { @spr = DXRubyFw::Sprite.new }

      it_should_behave_like 'Sprite basic function'
    end
  end
end
