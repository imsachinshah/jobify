Rails.application.routes.draw do
  
  # get 'dashboard/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # get "/home", to: "views#index"
  # root "/home"
  root "home#index"

  devise_for :users, path: "users"

  get "users/profile", to: 'profile#index'

  devise_scope :user do
    authenticated :user do
      namespace :users do
        # resources :jobs
        get "/home/index", as: :authenticated_root
      end
    end
  end

  resources :jobs do
    resources :skills
  end
    # resources :skills,:jobs
end
