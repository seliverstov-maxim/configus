require 'spec_helper'

# TODO: use autoload
require_relative '../lib/configus_builder.rb'

describe Configus do

  before :each do
    @configus = ConfigusBuilder.new
    @configus.build do
      database_pass 'secret'
    end
  end

  it 'should get value by key' do
    @configus.database_pass.should eql 'secret'
  end

end

