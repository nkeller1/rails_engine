require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :items}
    it {should have_many :invoices}
  end

  describe 'instance methods' do
    it ".most_revenue" do
      merchant = create(:merchant)
      merchant1 = create(:merchant)

      item = create(:item, merchant: merchant)
      item1 = create(:item, merchant: merchant)
      item2 = create(:item, merchant: merchant1)

      customer = create(:customer)
      customer1 = create(:customer)
      customer2 = create(:customer)

      invoice = create(:invoice, customer: customer, merchant: merchant)
      invoice1 = create(:invoice, customer: customer1, merchant: merchant)
      invoice2 = create(:invoice, customer: customer2, merchant: merchant1)

      invoiceitem = create(:invoice_item, item: item, invoice: invoice)
      invoiceitem1 = create(:invoice_item, item: item1, invoice: invoice1)
      invoiceitem2 = create(:invoice_item, item: item2, invoice: invoice2)

      transaction = create(:transaction, invoice: invoice)
      transaction1 = create(:transaction, invoice: invoice1)
      transaction2 = create(:transaction, invoice: invoice2)

      expect(Merchant.all.most_revenue(2)).to eq([merchant, merchant1])
      expect(Merchant.all.most_revenue(1)).to eq([merchant])
      expect(Merchant.all.most_revenue(1)).not_to eq([merchant1])
    end
  end
end
