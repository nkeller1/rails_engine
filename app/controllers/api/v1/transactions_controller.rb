class Api::V1::TransactionsController < ApplicationController
  def index
    @transactions = Transaction.all
  end
end
