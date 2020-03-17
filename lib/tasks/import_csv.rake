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
end
