Rails.application.routes.draw do
  root to: "pages#home"

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  resources :activities do
    resources :streaks
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
