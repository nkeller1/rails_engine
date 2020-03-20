Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :merchants
      namespace :merchants do
        get '/:id/items', to: 'merchant_items#index'
        get '/find', to: 'find#index'
        get '/find_all', to: 'find#show'
      end

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
