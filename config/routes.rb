Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get '/merchants/:id/items', to: 'merchant_items#index'
      get '/merchants/find', to: 'merchant_find#show'
      get 'merchants/find_all', to: 'merchant_find#index'
      get '/merchants/most_revenue', to: 'most_revenue#index'
      get '/merchants/most_items_sold', to: 'most_items_sold#index'
      get '/merchants/:id/revenue', to: 'revenue#index'
      resources :merchants

      get '/items/:id/merchant', to: 'items_merchant#index'
      get '/items/find', to: 'item_find#show'
      get '/items/find_all', to: 'item_find#index'
      resources :items

      resources :invoices, only: [:index]
      resources :customers, only: [:index]
      resources :transactions, only: [:index]
    end
  end
end
