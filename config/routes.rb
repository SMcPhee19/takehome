Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/teas', to: 'teas#index'
      get 'customers', to: 'customers#index'
      post ':subscription', to: 'subscriptions#create'
      put 'subscriptions/:subscription_id/cancel', to: 'subscriptions#cancel'
      get 'customers/:customer_id/subscriptions', to: 'subscriptions#index'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
