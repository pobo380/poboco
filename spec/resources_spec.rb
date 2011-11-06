require File.expand_path('../helper', __FILE__)

module Poboco
  # = Test for Resources Class
  describe Resources do
    describe 'should be singleton.' do
      it 'raise error when Resources#new called.' do
        expect { Resources.new }.to raise_error
      end

      it "should be able to load Sound." do
        Resources.sounds(:click).load(File.expand_path('../resources/click.wav', __FILE__))
      end

      it "should be able to load Image." do
        Resources.graphics(:button).load(File.expand_path('../resources/button.png', __FILE__))
      end
    end
  end
end
