Rails.application.routes.draw do
  get 'bookings/create'
  devise_for :users, controllers: { registrations: 'users/registrations' }

  get '/unapproved_list', to: 'unapproved_users#unapprovedlist'
  get '/hebergements', to: 'dashboards#hebergements'
  get '/sejours', to: 'dashboards#sejours'
  get '/profile', to: 'dashboards#profile'

  # Search
  get '/search', to: 'flats#search'

  resources :flats do
    resources :bookings, only: [:create]
    resources :photos, only: [:new, :create, :edit]
  end

  root to: 'pages#home'
end
