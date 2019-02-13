Rails.application.routes.draw do
  get 'bookings/create'
  devise_for :users, controllers: { registrations: 'users/registrations' }

  get '/unapproved_list', to: 'unapproved_users#unapprovedlist'
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

  root to: 'pages#home'
end

