Rails.application.routes.draw do
  devise_for :users
  resources :users, only: %i[index show new create edit update destroy] do
    resources :requests, only: %i[index show new create edit update destroy]
  end

  get '/households/:id/dashboard', to: 'households#dashboard', as: 'dashboard'
  root to: "pages#home"
  resources :households, only: %i[index show new create edit update destroy] do
    resources :tasks, only: %i[index show new create edit update destroy]
    resources :rules, only: %i[index new create edit update destroy]
    patch '/tasks/:id/update', to: 'tasks#update', as: 'updated_task'
  end
end
