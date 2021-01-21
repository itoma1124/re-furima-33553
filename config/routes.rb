Rails.application.routes.draw do
  get 'favorites/new'
  get 'favorites/create'
  devise_for :users
  root to: "items#index"
  resources :items do
    resources :orders, only:[:index,:create]
    resources :comments, only: :create
    resources :favorites, only: [:create, :destory]
  end
end
