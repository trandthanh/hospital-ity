Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users, controllers: { registrations: 'users/registrations' }
end
