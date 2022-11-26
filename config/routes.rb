Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'}
  # devise_for :users
  resources :users, only: %i[index show new create edit update destroy] do
    resources :requests, only: %i[index show new create edit update destroy]
  end

  get '/households/:id/configuration', to: 'households#configuration', as: 'configuration'
  get 'welcome', to: 'pages#welcome', as: 'welcome'

  root to: "pages#home"
  resources :households, only: %i[index show new create edit update destroy] do
    resources :tasks, only: %i[index show new create edit update destroy]
    resources :rules, only: %i[index new create edit update destroy]
    patch '/tasks/:id/update', to: 'tasks#update', as: 'updated_task'
    get '/dashboard', to: 'households#dashboard', as: 'dashboard'

  end
end
