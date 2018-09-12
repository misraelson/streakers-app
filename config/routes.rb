Rails.application.routes.draw do
  require 'sidekiq/web'
  require 'sidekiq/cron/web'
  mount Sidekiq::Web => '/sidekiq'

  root to: "pages#home"

  namespace :v1, defaults: { format: :json } do
    resource :sessions, only: [:create, :destroy]
    resources :activities, only: [:index, :create, :update, :destroy] do
      resources :streaks, only: [:index, :create, :update]
    end
    resources :users, only: [:create]
  end

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  # resources :activities do
  #   resources :streaks
  # end
end
