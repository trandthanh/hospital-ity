Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  get '/unapproved_list', to: 'unapproved_users#unapprovedlist'

  root to: 'pages#home'
end
