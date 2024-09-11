Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  
  
  # Products
  post "/products" => "products#create"
  get "/products/:id" => "products#show"
  get "/products" => "products#index"
  patch "/products/:id" => "products#update"
  delete "/products/:id" => "products#destroy"
  
  # Suppliers
  post "/suppliers" => "suppliers#create"
  get "/suppliers/:id" => "suppliers#show"
  get "/suppliers" => "suppliers#index"
  patch "/suppliers/:id" => "suppliers#update"
  delete "/suppliers/:id" => "suppliers#destroy"

  # Users
  post "/users" => "users#create"
  get "/users/:id" => "users#show"
  get "/users" => "users#index"

  # Sessions
  post "/sessions" => "sessions#create"

  # Defines the root path route ("/")
  # root "posts#index"
  # 
end
