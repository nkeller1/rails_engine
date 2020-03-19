Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :invoices, only: [:index]
      resources :customers, only: [:index]
      resources :items, only: [:index]
      resources :merchants
      resources :transactions, only: [:index]
    end
  end
end
