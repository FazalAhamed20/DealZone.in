Rails.application.routes.draw do
  
  resources :signup, only: [  :new, :create ]
  resources :login, only: [ :new, :create ]

  resources :products do
    collection do
      get :my_product
    end
    resources :requests, only: [ :new, :create, :index, :update ] 
  end


get "/requested_products", to: "requests#requested_products"

get "/logout", to: "login#destroy"
  # get "/signup", to: "signup#index"
  # post "/signup", to: "signup#create"
  # get "/login", to: "login#index"
  #  post "/login", to: "login#create"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "home#index"
end
