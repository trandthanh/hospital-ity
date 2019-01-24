Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :unapproved_users

  root to: 'pages#home'
end
