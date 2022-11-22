Rails.application.routes.draw do
  devise_for :users
  resources :users, only: %i[index show new create edit update destroy]
  root to: "pages#home"
  resources :households, only: %i[index show new create edit update destroy] do
    resources :tasks, only: %i[index show new create edit update destroy]
    resources :rules, only: %i[index edit update new create]
  end

end
