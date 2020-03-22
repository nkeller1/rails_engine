class Merchant < ApplicationRecord
  validates_presence_of :name

  has_many :items
  has_many :invoice_items, through: :items

  has_many :invoices
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices

  def self.most_revenue(quantity)
    self.all
    .joins(:invoices)
    .joins(:invoice_items)
    .joins(:transactions)
    .where(transactions: {result: :success})
    .select('merchants.*, sum(invoice_items.unit_price*invoice_items.quantity) as revenue')
    .group(:id)
    .order(revenue: :desc)
    .limit(quantity)
  end
end
