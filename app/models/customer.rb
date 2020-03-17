class Customer < ApplicationRecord
  require 'csv'
  validates_presence_of :first_name, :last_name

  def self.import(file)
    CSV.foreach(file, headers: true) do |row|
      require "pry"; binding.pry
      Customer.create! row.to_hash
    end
  end
end
