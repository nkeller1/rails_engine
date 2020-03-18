Rails.application.routes.draw do
  get 'customers/index'
  get 'customers/import'

  get 'merchants/index'

  get 'items/index'

  get 'invoices/index'

  get 'transactions/index'
end
