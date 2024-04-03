Rails.application.routes.draw do

  get 'candidates/index'
  get 'candidates/show'
  post 'candidates/show'
  get 'educations/new'
  get 'educations/edit'

  root "home#index"

  devise_for :users, path: "users", controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }


  get "users/profile", to: 'profile#index'
  post "users/profile", to: 'profile#index'

  devise_scope :user do
    authenticated :user do
      namespace :users do
        get "/home/index", as: :authenticated_root
      end
    end
  end

  resources :jobs do
    resources :skills
  end

  resources :addresses
  resources :experiences

  resources :applied_jobs

  get 'payment-invoice', to: 'applied_jobs#payment_invoice'
  post 'payment-invoice', to: 'applied_jobs#payment_invoice'
  get 'payment_success', to: 'applied_jobs#payment_success'
  post 'payment_success', to: 'applied_jobs#payment_success'

end
