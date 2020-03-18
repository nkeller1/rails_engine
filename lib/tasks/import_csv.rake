require 'csv'
# require './app/models/application_record'
# require './app/models/customer'
desc "import data from CSVs"
  namespace :import do
  task :customers => :environment do
    Customer.destroy_all
    CSV.foreach('lib/customers.csv', headers: true) do |row|
      row = row.to_hash
      Customer.new(
        :id => row['id'],
        :first_name => row['first_name'],
        :last_name => row['last_name'],
        :created_at => row['created_at'],
        :updated_at => row['updated_at'],
      )

    end
    puts "Customer Data Imported"
  end

  task :invoices => :environment do
    Invoice.destroy_all
    CSV.foreach('lib/invoices.csv', headers: true) do |row|
      row = row.to_hash
      Invoice.new(
        :id => row['id'],
        :status => row['status'],
        :merchant_id => row['merchant_id'],
        :customer_id => row['customer_id'],
        :created_at => row['created_at'],
        :updated_at => row['updated_at'],
      )
    end
    puts "Invoice Data Imported"
  end

  task :items => :environment do
    Item.destroy_all
    CSV.foreach('lib/items.csv', headers: true) do |row|
      row = row.to_hash
      Item.new(
        :id => row['id'],
        :name => row['name'],
        :description => row['description'],
        :unit_price => row['unit_price'],
        :merchant_id => row['merchant_id'],
        :created_at => row['created_at'],
        :updated_at => row['updated_at'],
      )
    end
    puts "Item Data Imported"
  end

  task :invoice_items => :environment do
    InvoiceItem.destroy_all
    CSV.foreach('lib/invoice_items.csv', headers: true) do |row|
      row = row.to_hash
      InvoiceItem.new(
        :id => row['id'],
        :quantity => row['quantity'],
        :unit_price => row['unit_price'],
        :invoice_id => row['invoice_id'],
        :item_id => row['item_id'],
        :created_at => row['created_at'],
        :updated_at => row['updated_at'],
      )
    end
    puts "Invoice Item Data Imported"
  end

  task :merchants => :environment do
    Merchant.destroy_all
    CSV.foreach('lib/merchants.csv', headers: true) do |row|
      row = row.to_hash
      Merchant.new(
        :id => row['id'],
        :name => row['name'],
        :created_at => row['created_at'],
        :updated_at => row['updated_at'],
      )
    end
    puts "Merchant Data Imported"
  end

  task :transactions => :environment do
    Transaction.destroy_all
    CSV.foreach('lib/transactions.csv', headers: true) do |row|
      row = row.to_hash
      Transaction.new(
        :id => row['id'],
        :credit_card_number => row['credit_card_number'],
        :credit_card_expiration_date => row['credit_card_expiration_date'],
        :result => row['result'],
        :invoice_id => row['invoice_id'],
        :created_at => row['created_at'],
        :updated_at => row['updated_at'],
      )
    end
    puts "Transaction Data Imported"
  end
end
