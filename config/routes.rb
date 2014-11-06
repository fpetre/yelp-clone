Rails.application.routes.draw do
  #root to: 'cities#show'
  root to: "static_pages#backbone"

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
    get "/search", as: :search, to: "static_pages#search"
    resource :session, only: [:create, :destroy]
    resources :users, only: [:show, :index, :create, :update]
    resources :businesses, only: [:create, :update, :show, :index]
    resources :reviews, only: [:update, :create, :show, :index]
    resources :cities, only: [:show, :index]
  end
end
