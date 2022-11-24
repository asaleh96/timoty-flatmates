Rails.application.routes.draw do
  devise_for :users
  resources :users, only: %i[index show]
  # devise takes care of the other routes
  root to: "pages#home"
  resources :households, only: %i[index show new create edit update destroy] do
    resources :tasks, only: %i[index show new create edit update destroy]
    resources :rules, only: %i[index new create edit update destroy]
    patch '/tasks/:id/update', to: 'tasks#update', as: 'updated_task'
  end
end
