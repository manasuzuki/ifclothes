Rails.application.routes.draw do
  resources :posts
  root to: 'posts#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  resources :users, only: [:show, :new, :create, :update, :edit] do
  #ユーザー詳細、新規ユーザー、ユーザー編集ができる
    member do #idが含まれたurl作れる
      get :buys #カート一覧
    end
  end  
  get 'post', to: "posts#index"
  resources :posts
   resources :buyings, only:[:create, :destroy, :update]
end
