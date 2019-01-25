Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  get '/unapproved_list', to: 'unapproved_users#unapprovedlist'
  get '/hebergements', to: 'dashboards#hebergements'

  resources :flats

  root to: 'pages#home'
end
