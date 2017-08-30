Rails.application.routes.draw do
  resources :tacs
  devise_for :users
  root 'pages#home'
  get 'about', to: 'pages#about'
end
