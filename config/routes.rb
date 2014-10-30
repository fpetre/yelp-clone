Rails.application.routes.draw do
  root to: 'cities#show'
  resources :cities, only: [:show]
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :businesses, only: [:new, :create, :edit, :update, :show, :index] do
    resources :reviews, only: [:new]
  end
  resources :reviews, only: [:create, :edit, :update, :destroy]
end
