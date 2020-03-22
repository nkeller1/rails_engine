class Merchant < ApplicationRecord
  validates_presence_of :name

  has_many :items
  has_many :invoice_items, through: :items

  has_many :invoices
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices

  def self.most_revenue(quantity)
    joins(invoices: [:invoice_items, :transactions])
    .select('merchants.*, sum(invoice_items.quantity * invoice_items.unit_price) as revenue')
    .group(:id)
    .where(transactions: {result: :success})
    .order(revenue: :desc)
    .limit(quantity)
  end

  def self.most_items_sold(quantity)
    joins(invoices: [:transactions])
    .joins(:items)
    .where(transactions: {result: :success})
    .select('merchants.*, count(items) AS count')
    .group(:id)
    .order(count: :desc)
    .limit(quantity)
  end
end
