Rails.application.routes.draw do
  require 'sidekiq/web'
  require 'sidekiq/cron/web'
  mount Sidekiq::Web => '/sidekiq'

  root to: "pages#home"

  namespace :v1, defaults: { format: :json } do
    resources :sessions, only: [:create, :destroy]
    resources :users, only: [:create]
    resources :activities
  end

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  resources :activities do
    resources :streaks
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
