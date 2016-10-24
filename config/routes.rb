Rails.application.routes.draw do

  namespace :admin do
    get '/dashboard' => 'dashboard#index'
    resources :users
  end
  get '/dashboard' => 'dashboard#index'
  get "/login" => "sessions#new", as: :login
  post "/login" => "sessions#create"
  get "/logout" => "sessions#logout", as: :logout



  resources :users do
    member do
      post :changepassword
    end
    end
end
