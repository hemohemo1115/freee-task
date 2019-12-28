Rails.application.routes.draw do
  get 'users/new'
  get 'sessions/new'
  get 'rooms/show'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'rooms#index'
  #get '/index', to: 'rooms#index'
  get '/create', to: 'rooms#create'
  #RESTfulなURLを自動生成
  resources :rooms, only: %i[show]
  resources :users #rails tutorial
end
