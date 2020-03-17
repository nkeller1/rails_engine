class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def import
    Customer.import(params[:file])
  end
end
