Rails.application.routes.draw do
  root to: 'users#show'
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :edit]
end
