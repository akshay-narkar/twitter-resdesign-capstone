Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'tweets#new'
  resources :users, only: [:show, :create, :show]
  resources :tweets, only: [:new, :create]
  resources :sessions, only: [:new, :create,:destroy]
  resources :followings, only: [:new,:create,:destroy]
end
