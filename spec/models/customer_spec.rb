require 'rails_helper'

RSpec.describe Customer, type: :model do
  customer = Customer.create!
    first_name { "Nathan" }
    last_name { "Keller" }
end
