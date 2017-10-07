Rails.application.routes.draw do
  resources :tacs
  devise_for :users
  root 'tacs#index'
  get 'about', to: 'pages#about'
end
