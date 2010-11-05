require 'spec_helper'

describe Photoset do
  before(:each) do
    @valid_attributes = {
      
    }
  end

  # it "should create a new instance given valid attributes" do
  #   Photoset.create!(@valid_attributes)
  # end
  
  it 'finds all photosets from user' do
    Photoset.all
  end
end
