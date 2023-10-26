Rails.application.routes.draw do
  get 'candidates/index'
  get 'candidates/show'
  post 'candidates/show'
  get 'educations/new'
  get 'educations/edit'
  get 'experiences/new'
  get 'experiences/edit'

  root "home#index"

  devise_for :users, path: "users", controllers: {
    sessions: 'users/sessions'
  }


  get "users/profile", to: 'profile#index'
  # post "users/profile", to: 'profile#index'

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

  resources :addresses

  resources :applied_jobs

  get 'payment-invoice', to: 'applied_jobs#payment_invoice'
  post 'payment-invoice', to: 'applied_jobs#payment_invoice'
  get 'payment_success', to: 'applied_jobs#payment_success'
  post 'payment_success', to: 'applied_jobs#payment_success'

end
