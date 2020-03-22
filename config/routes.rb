Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get '/merchants/:id/items', to: 'merchant_items#index'
      get '/merchants/find', to: 'merchant_find#show'
      get '/merchants/most_revenue', to: 'most_revenue#index'
      resources :merchants
        # get '/find_all', to: 'find#show'

      # namespace :items do
        get '/items/:id/merchant', to: 'items_merchant#index'
        get '/items/find', to: 'item_find#show'
        resources :items
        # get '/find_all', to: 'find#show'
      # end

      resources :invoices, only: [:index]
      resources :customers, only: [:index]
      resources :transactions, only: [:index]
    end
  end
end
