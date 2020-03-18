require 'rails_helper'

RSpec.describe Customer, type: :model do

  describe 'validations' do
    it {should validate_presence_of :first_name}
    it {should validate_presence_of :last_name}
  end

  xit 'can import rows from a CSV' do
    Customer.destroy_all
    Customer.import('spec/fixtures/customers.csv')
    # require "pry"; binding.pry
    expect(Customer.all.count).to eq(5)
  end
end
