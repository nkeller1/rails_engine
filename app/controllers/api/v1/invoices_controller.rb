class Api::V1::InvoicesController < ApplicationController
  def index
    @invoices = Invoice.all
  end
end
