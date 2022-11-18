Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :edit, :update]
  root to: "pages#home"


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :rules, only: [:index, :edit, :update, :new, :create]
end
