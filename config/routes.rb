Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  # CREATE
  post "/products" => "products#create"

  # READ
  get "/products/:id" => "products#show"
  get "/products" => "products#index"

  # UPDATE
  patch "/products/:id" => "products#update"
  
  # DELETE
  delete "/products/:id" => "products#destroy"


  post "/suppliers" => "suppliers#create"

  # READ
  get "/suppliers/:id" => "suppliers#show"
  get "/suppliers" => "suppliers#index"

  # UPDATE
  patch "/suppliers/:id" => "suppliers#update"
  
  # DELETE
  delete "/suppliers/:id" => "suppliers#destroy"
  # Defines the root path route ("/")
  # root "posts#index"
end
