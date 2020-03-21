Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get '/merchants/:id/items', to: 'merchant_items#index'
      get '/merchants/find', to: 'find#index'
      resources :merchants
        # get '/find_all', to: 'find#show'

      resources :items
      namespace :items do
        get '/:id/merchant', to: 'items_merchant#index'
        get '/find', to: 'find#index'
        get '/find_all', to: 'find#show'
      end

      resources :invoices, only: [:index]
      resources :customers, only: [:index]
      resources :transactions, only: [:index]
    end
  end
end
