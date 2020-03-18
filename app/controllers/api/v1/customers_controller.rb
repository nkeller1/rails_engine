class Api::V1::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end
end
