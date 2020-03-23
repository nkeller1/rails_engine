require 'csv'

desc "import data from CSVs"
  task :import => :environment do
    system "rake db:reset > /dev/null"
    ActiveRecord::Base.connection.tables.each do |t|
       ActiveRecord::Base.connection.reset_pk_sequence!(t)
     end

    CSV.foreach('lib/customers.csv', headers: true) do |row|
      row = row.to_hash
      Customer.create(
        :id => row['id'],
        :first_name => row['first_name'],
        :last_name => row['last_name'],
        :created_at => row['created_at'],
        :updated_at => row['updated_at'],
      )
    end
    puts "Customer Data Imported"

    CSV.foreach('lib/merchants.csv', headers: true) do |row|
      row = row.to_hash
      Merchant.create(
        :id => row['id'],
        :name => row['name'],
        :created_at => row['created_at'],
        :updated_at => row['updated_at'],
      )
    end
    puts "Merchant Data Imported"

    CSV.foreach('lib/items.csv', headers: true) do |row|
      ActiveRecord::Base.connection.reset_pk_sequence!('items')
      row = row.to_hash
      Item.create(
        :id => row['id'],
        :name => row['name'],
        :description => row['description'],
        :unit_price => (row['unit_price'].to_i / 100.00),
        :merchant_id => row['merchant_id'],
        :created_at => row['created_at'],
        :updated_at => row['updated_at'],
      )
    end
    puts "Item Data Imported"

    CSV.foreach('lib/invoices.csv', headers: true) do |row|
      row = row.to_hash
      Invoice.create(
        :id => row['id'],
        :status => row['status'],
        :merchant_id => row['merchant_id'],
        :customer_id => row['customer_id'],
        :created_at => row['created_at'],
        :updated_at => row['updated_at'],
      )
    end
    puts "Invoice Data Imported"

    CSV.foreach('lib/invoice_items.csv', headers: true) do |row|
      row = row.to_hash
      InvoiceItem.create(
        :id => row['id'],
        :quantity => row['quantity'],
        :unit_price => (row['unit_price'].to_i / 100.00),
        :invoice_id => row['invoice_id'],
        :item_id => row['item_id'],
        :created_at => row['created_at'],
        :updated_at => row['updated_at'],
      )
    end
    puts "Invoice Item Data Imported"

    CSV.foreach('lib/transactions.csv', headers: true) do |row|
      row = row.to_hash
      Transaction.create(
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
