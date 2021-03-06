require 'sidekiq/web'

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :rooms
  namespace :admin do
    resources :users
    resources :announcements
    resources :notifications
    resources :services

    root to: "users#index"
  end
  get '/privacy', to: 'home#privacy'
  get '/terms', to: 'home#terms'
    authenticate :user, lambda { |u| u.admin? } do
      mount Sidekiq::Web => '/sidekiq'
    end


  resources :notifications, only: [:index]
  resources :announcements, only: [:index]
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'predmets',      to: 'predmets#index'  # А пока что постараемся просто вывести список ...
  get 'predmets/mine', to: 'predmets#show'   # ... всех предметов, на которые записан чувак
  get 'checkings',     to: 'checkings#index'
  get 'checkings/new', to: 'checkings#new'
  post 'checkings',    to: 'checkings#create'

end
