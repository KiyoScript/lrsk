Rails.application.routes.draw do
  get 'up' => 'rails/health#show', as: :rails_health_check

  devise_for :users, path: '', path_names: { sign_in: 'sign_in', sign_up: 'sign_up'}

  root to: 'home#index'
end
