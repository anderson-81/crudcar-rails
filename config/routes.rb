Rails.application.routes.draw do
  #Devise
  devise_for :users

  devise_scope :user do
    get '/logout',  :to => 'sessions#destroy'
  end

  # Root
  root 'home#index'

  # Customers
  get '/customers', to: 'customers#index', as: 'customers'
  get '/customers/new', to: 'customers#new', as: 'customer_new'
  post '/customers/new', to: 'customers#create', as: 'customer_create'
  get '/customers/:customer_id', to: 'customers#show', as: 'customer_show'
  get '/customers/:customer_id/edit', to: 'customers#edit', as: 'customer_edit'
  patch '/customers/:customer_id/update', to: 'customers#update', as: 'customer_update'
  delete '/customers/:customer_id/destroy', to: 'customers#destroy', as: 'customer_destroy'

  # Cars
  get '/customers/:customer_id/cars', to: 'cars#index', as: 'customer_cars'
  get '/customers/:customer_id/cars/new', to: 'cars#new', as: 'customer_car_new'
  post '/customers/:customer_id/cars/new', to: 'cars#create', as: 'customer_car_create'
  get '/customers/:customer_id/cars/:car_id/edit', to: 'cars#edit', as: 'customers_car_edit'
  patch '/customers/:customer_id/cars/:car_id/edit', to: 'cars#update', as: 'customers_car_update'
  delete '/customers/:customer_id/cars/:car_id/edit', to: 'cars#destroy', as: 'customers_car_destroy'
end
