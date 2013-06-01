require 'spec_helper'

describe Configus do

  before :each do
    @configus = Configus.build(:development) do
      env :development do
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
    end
  end

  it 'should get value by key' do
    @configus.database_pass.should eql 'secret_development'
  end

  it 'should get nested value by key' do
    @configus.database.pass.should eql 'secret_development'
  end

end

