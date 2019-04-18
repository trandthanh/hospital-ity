Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  get '/community', to: 'unapproved_users#unapprovedlist', as: :community
  get '/hebergements', to: 'dashboards#hebergements'
  get '/sejours', to: 'dashboards#sejours'
  get '/profile', to: 'dashboards#profile'
  get '/public_profile/:id', to: 'dashboards#public_profile', as: :public_profile

  # Search
  get '/search', to: 'flats#search'

  resources :flats do
    resources :bookings, only: [:create]
    resources :photos, only: [:new, :create, :edit, :update]
    resources :reviews, only: [:new, :create, :edit, :update]
    member do
      patch :toggle_available_status
    end
  end

  resources :unapproved_users do
    member do
      patch :activate_user_account
    end
  end

  resources :hospitals do
    resources :codes, only: [:new, :create]
  end

  resources :codes, only: [:destroy]

  root to: 'pages#home'
end

