require File.expand_path('../helper', __FILE__)

module Poboco
  # = Test for Resources Class
  describe Resources do
    it 'should be singleton.' do
      expect { Resource.new }.to raise_error
    end
  end
end
