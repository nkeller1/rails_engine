class CreateInvoiceItems < ActiveRecord::Migration[6.0]
  def change
    create_table :invoice_items do |t|
      t.integer :quantity
      t.float :unit_price
      t.references :item, null: false, foreign_key: true
      t.references :invoice, null: false, foreign_key: true

      t.timestamps
    end
  end
end
