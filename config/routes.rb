Rails.application.routes.draw do
  get 'candidates/index'
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

end
