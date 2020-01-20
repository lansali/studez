Rails.application.routes.draw do
  get 'error/error'
  get 'error/access_denied'
  get 'error/unauthorized'
  get 'error/not_found'
  get 'error/server_error'
  resources :skills
  get 'info/privacy_policy'
  get 'info/terms_of_service'
  get 'info/security_policy'
  resources :resumes
  resources :submissions
  resources :businesses
  resources :employers
  resources :students
  resources :posts
  resources :opportunities
  get 'home/index'
  root 'home#index'
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
