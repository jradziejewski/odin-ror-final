Rails.application.routes.draw do
  get 'users/index'
  root 'posts#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  match '/users', to: 'users#index', via: 'get'
  match '/users/:id',     to: 'users#show', via: 'get'

  resources :posts, only: [:index]

  resources :users do
    resources :posts
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
end
