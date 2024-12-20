Rails.application.routes.draw do
 

  resources :signup, only: [  :new, :create ]
  resources :login, only: [ :new, :create ]

  resources :products do
  collection do
    get :my_product
  end
  resources :requests, only: [ :new, :create, :index, :update ] 
   
end

get '/requested_products', to: 'requests#requested_products'








get '/logout', to: 'login#destroy'
  # get "/signup", to: "signup#index"
  # post "/signup", to: "signup#create"
  # get "/login", to: "login#index"
  #  post "/login", to: "login#create"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
 

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "home#index"
end
