require 'spec_helper'

RSpec.describe Registrant do
  before(:each) do
    @registrant = Registrant.new("Bruce", 18, true)
  end
  
  describe '#initialize' do
    it 'can initialize' do
      expect(@registrant).to be_an_instance_of(Registrant)
      expect(@registrant.name).to eq('Bruce')
      expect(@registrant.age).to eq(18)
      expect(@registrant.permit).to eq(true)
      expect(@registrant.license_data[:written]).to eq(false)
      expect(@registrant.license_data[:license]).to eq(false)
      expect(@registrant.license_data[:renewed]).to eq(false)
    end
  end
end