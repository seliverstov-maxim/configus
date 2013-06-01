require 'spec_helper'

describe Configus do

  before :each do
    @configus = Configus.build(:development) do
      env :development, parent: :none do
        database_pass 'secret_development'
        database do
          pass 'secret_development'
        end
      end
      env :test, parent: :development do
        database_pass 'secret_test'
      end
      env :production do
        database_pass 'secret_production'
      end
      env :none do
        name 'max'
        database do
          pass2 'secret_development2'
        end
      end
    end
  end

  it 'should get value by key' do
    @configus.database_pass.should eql 'secret_development'
  end

  it 'should get nested value by key' do
    @configus.database.pass.should eql 'secret_development'
  end

  it 'should nested env' do
    @configus.name.should eql 'max'
  end
end

