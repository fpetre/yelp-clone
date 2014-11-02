Rails.application.routes.draw do
  root to: 'cities#show'

  get "/search", as: :search, to: "static_pages#search"
  get "/writeareview", as: :review_search, to: "reviews#search"

  resources :cities, only: [:show]
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :businesses, only: [:new, :create, :edit, :update, :show, :index] do
    resources :reviews, only: [:new]
  end
  resources :reviews, only: [:create, :edit, :update, :destroy]

  namespace :api, :defaults => {format: :JSON } do
    resources :users, only: [:show, :index]
    resources :businesses, only: [:show, :index]
    resources :reviews, only: [:update, :create, :show]

  end
end


