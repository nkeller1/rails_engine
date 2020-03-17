class Customer < ApplicationRecord
  # require 'csv'
  validates_presence_of :first_name, :last_name

  # def self.import(file)
  #   CSV.foreach(file, headers: true) do |row|
  #     row = row.to_hash
  #     Customer.create!(
  #       :id => row['id'],
  #       :first_name => row['first_name'],
  #       :last_name => row['last_name'],
  #       :created_at => row['created_at'],
  #       :updated_at => row['updated_at'],
  #     )
  #   end
  # end
end
