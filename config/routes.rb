Rails.application.routes.draw do
  root 'users#index'
  get "/search", to: "searches#search"

  resources :users
end