Rails.application.routes.draw do

  root to: 'welcome#index'

  get 'up' => 'rails/health#show', as: :rails_health_check
  get 'home' => 'home#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }, path: '', path_names: { sign_in: 'sign_in', sign_up: 'sign_up' }



  namespace :dashboard do
    resources :profile, only: %i[index update destroy]
    resources :staffs
    resources :patients
    resources :physicians
  end

  namespace :patients do
    resources :consults
    resources :physical_examinations
  end
end
