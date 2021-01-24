Rails.application.routes.draw do
  root 'users#new'
  resources :tasks
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  namespace :admin do
    resources :users, only:[:index, :edit, :update, :new, :create, :show, :destroy]
  end
end
