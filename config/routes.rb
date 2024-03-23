Rails.application.routes.draw do
  get 'up' => 'rails/health#show', as: :rails_health_check

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }, path: '', path_names: { sign_in: 'sign_in', sign_up: 'sign_up' }

  namespace :dashboard do
    resources :profile, only: %i[index update destroy]
    resources :staffs
    resources :patients
  end

  root to: 'home#index'
end
