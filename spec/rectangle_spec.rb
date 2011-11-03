require File.expand_path('../helper', __FILE__)

module Poboco
  # = Test for Rectangle Class
  describe Rectangle, 'constructed width argument' do
    before do
      @contain   = [Rectangle.new(15, 25, 10, 10), Rectangle.new(15, 25, 0, 0)]
      @intersect = [Rectangle.new(5, 25, 10, 10), Rectangle.new(10, 15, 10, 10)]
      @not_inter = [Rectangle.new(0, 0, 5, 5), Rectangle.new(15, 5, 5, 5), Rectangle.new(40, 5, 5, 5), Rectangle.new(45, 65, 5, 5)]
    end

    share_examples_for 'basic function' do
      it 'should have accessor :x, :y, :width, :height' do
        @r.x = 1
        @r.y = 2
        @r.width = 3
        @r.height = 4
        @r.x.should == 1
        @r.y.should == 2
        @r.width.should == 3
        @r.height.should == 4
      end

      it 'should return points of 4 corners that the parent they have is equal to :pos.parent.' do
        @r.corner(:top_left).should == Point.new(10, 20)
        @r.corner(:top_right).should == Point.new(40, 20)
        @r.corner(:bottom_left).should == Point.new(10, 60)
        @r.corner(:bottom_right).should == Point.new(40, 60)

        [:top_left, :top_right, :bottom_left, :bottom_right].each do |e|
          @r.corner(e).parent.should be_equal(@r.pos.parent)
        end
      end

      it 'should know if it contains other Rectangle.' do
        @contain.each do |other|
          @r.contain?(other).should be_true
        end

        @intersect.each do |other|
          @r.contain?(other).should be_false
        end

        @not_inter.each do |other|
          @r.contain?(other).should be_false
        end
      end

      it 'should know if it intersects other Rectangle.' do
        @contain.each do |other|
          @r.intersect?(other).should be_true
        end

        @intersect.each do |other|
          @r.intersect?(other).should be_true
        end

        @not_inter.each do |other|
          @r.intersect?(other).should be_false
        end
      end
    end

    describe '(Point.new(10, 20), Point.new(30, 40)).' do
      before { @r = Rectangle.new(Point.new(10, 20), Point.new(30, 40)) }

      it_should_behave_like 'basic function'
    end

    describe '(10, 20, 30, 40).' do
      before { @r = Rectangle.new(10, 20, 30, 40) }

      it_should_behave_like 'basic function'
    end
  end
end
