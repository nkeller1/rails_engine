class AddMerchantsToInvoices < ActiveRecord::Migration[6.0]
  def change
    add_reference :invoices, :merchant, null: false, foreign_key: true
  end
end
