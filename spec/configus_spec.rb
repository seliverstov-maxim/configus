require 'spec_helper'

describe Configus do

  before :each do
    @configus = Configus.build(:development) do

      env :production, parent: :staging do
        login 'root'
        database_name 'customer_service'
        database_pass 'secret_production'
      end

      env :development, parent: :production do
        database_name 'LOL'
        database_pass 'secret_development'
        database do
          pass 'secret_development'
        end
      end

      env :test do
        database_pass 'secret_test'
      end

      env :staging do
        kitty 'Olya'
      end
    end
  end

  it 'should get value by key' do
    expect(@configus.database_pass).to eq('secret_development')
  end
  it 'should get nested value by key' do
    expect(@configus.database.pass).to eq('secret_development')
  end
  it 'should get value by key inherited from parent env' do
    expect(@configus.login).to eq('root')
  end
  it 'should override value inherited from parent env' do
    expect(@configus.database_name).to eq('LOL')
  end
  it 'should support deep inheritance' do
    expect(@configus.kitty).to eq('Olya')
  end
end

