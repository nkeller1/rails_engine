Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :invoices, only: [:index]
      resources :customers, only: [:index]
      resources :items, only: [:index]
    end
  end

  get 'merchants/index'

  get 'transactions/index'
end
