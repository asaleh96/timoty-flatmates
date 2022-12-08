Rails.application.routes.draw do
  get 'errors/not_found'
  get 'errors/internal_server_error'
  devise_for :users, controllers: {
    registrations: 'users/registrations'}

  resources :users, only: %i[index show new create edit update destroy] do
    resources :requests, only: %i[index show new create edit update destroy]
  end

  get '/households/:id/configuration', to: 'households#configuration', as: 'configuration'
  get 'welcome', to: 'pages#welcome', as: 'welcome'
  get 'about', to: 'pages#about', as: 'about'


  root to: "pages#home"
  resources :households, only: %i[index show new create edit update destroy] do
    resources :tasks, only: %i[index show new create edit update destroy]
    resources :rules, only: %i[index new create edit update destroy]
    resources :activities, only: %i[index show new create edit update destroy]
    patch '/tasks/:id/update', to: 'tasks#update', as: 'updated_task'
    get '/dashboard', to: 'households#dashboard', as: 'dashboard'
    get '/confirmation', to: 'households#confirmation', as: 'confirmation'
  end

  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin } do
    mount Sidekiq::Web => '/sidekiq'
  end

  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all
end
