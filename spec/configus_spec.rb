require 'spec_helper'

describe 'should get value by key' do
  database_pass.should eql 'secret'
end