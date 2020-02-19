Rails.application.routes.draw do
  resources :posts
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  resources :users, only: [:show, :new, :create]
  #ユーザー詳細、新規ユーザー、ユーザー編集ができる
  
  get 'post', to: "posts#index"
  resources :posts
  
end
