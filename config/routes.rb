Rails.application.routes.draw do
  root to: 'toppages#index'
  get 'signup', to: 'users#new'
  resources :users, only: [:show, :new, :create]
  #ユーザー詳細、新規ユーザー、ユーザー編集ができる
end
