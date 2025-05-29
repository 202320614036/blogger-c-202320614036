Rails.application.routes.draw do
  devise_for :users

  root "home#index"

  get "about", to: "home#about"
  get "projects", to: "home#projects"
  get "up", to: "rails/health#show", as: :rails_health_check

  # Kategoriler
  resources :categories

  # Kullanıcıya bağlı postlar
  resources :users, only: [] do
    resources :posts
    resource :profile, only: [:new, :create, :show, :edit, :update]
  end

  # Admin paneli için kullanıcı yönetimi
  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
  end
end
