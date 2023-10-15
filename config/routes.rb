Rails.application.routes.draw do
  root 'users#index'
  get '/search', to: 'searchs#search'

  resources :users
end