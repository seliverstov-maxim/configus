require 'spec_helper'

describe Configus do

  before :each do
    @configus = Configus.build(:development) do
      database_pass 'secret'
      # database.pass 'secret'
    end
  end

  it 'should get value by key' do
    @configus.database_pass.should eql 'secret'
  end

  # it 'should get nested value by key' do
  #  @configus.database.pass eql 'secret'
  # end

end

