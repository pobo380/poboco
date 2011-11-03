require File.expand_path('../helper', __FILE__)

module Poboco
  # = Test for Point Class
  describe Point do
    describe 'constructs with argument (5, 2).' do
      before { @p = Point.new(5, 2, nil) }

      share_examples_for 'basic calculation' do
        it 'should have reader :x, :y, :parent.' do
          @p.x.should == 5
          @p.y.should == 2
        end

        it 'should have writer :x, :y.' do
          @p.x = -2
          @p.y = 4
          @p.x.should == -2
          @p.y.should == 4
        end

        it 'should be equal to Point.new(5, 2) and Point.new(5, 2, parent).' do
          @p.should == Point.new(5, 2)
          @p.should == Point.new(5, 2, Point.new(8, 8))
        end

        it 'should be able to do addition.' do
          (@p + Point.new(2, 3)).should == Point.new(7, 5)
        end

        it 'should be able to do subtraction.' do
          (@p - Point.new(2, 3)).should == Point.new(3, -1)
        end

        it 'should be able to move position with argument (dx, dy).' do
          @p.move(1, -5).should == Point.new(6, -3)
        end

        it 'should be able to move to position with argument (x, y).' do
          @p.move_to(1, -5).should == Point.new(1, -5)
        end

        it 'should be able to addition that has side effect.' do
          @p.plus!(Point.new(2, 3)).should == Point.new(7, 5)
          @p.should be_==(Point.new(7, 5))
        end

        it 'should be able to subtraction that has side effect.' do
          @p.minus!(Point.new(2, 3)).should == Point.new(3, -1)
          @p.should == Point.new(3, -1)
        end
      end

      share_examples_for 'absolute position' do
        it 'should be absolute position.' do
          @p.should be_absolute
        end
      end

      share_examples_for 'be able to have parent point.' do
        it 'should be able to set parent.' do
          parent = Point.new(4, 3)
          @p.child_of(parent)
          @p.parent.should be_equal?(parent)
        end
      end

      describe 'When it has no parent point.' do
        it_should_behave_like 'basic calculation'
        it_should_behave_like 'absolute position'

        it 'should have no parent.' do
          @p.parent.should be_nil
        end
      end

      describe 'When it has parent point constructed with argument (8, -2, Point.new(-8, 2)).' do
        before { @p = Point.new(5, 2, Point.new(8, -2, Point.new(-8, 2))) }

        it_should_behave_like 'basic calculation'

        it 'should have parent.' do
          @p.parent.should_not be_nil
        end

        describe 'When it\'s absolute position.' do
          before { @p = @p.absolute }

          it_should_behave_like 'basic calculation'
          it_should_behave_like 'absolute position'
        end
      end
    end
  end
end
