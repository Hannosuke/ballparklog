# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "ballpark_logs#index"

  post "/guest" => "guest_sessions#create"
  get  "/login" => "sessions#new"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"
  get  "users/login" => "users#login_form"
  post "users/login" => "users#login"
  delete "users/logout" => "users#logout"

  get "users/:id/likes" => "users#likes"

  namespace :users do
    resources :passwords, only: %i[new create edit update], param: :password_reset_token
  end

  resources :ballpark_logs do
    resources :likes, only: %i[create destroy]
    resources :comments, only: %i[create destroy]
  end
  post "/ballpark_logs/:ballpark_log_id/like/:id" => "likes#destroy"

  resources :users

  namespace :api, format: "json" do
    resources :games, only: :index
  end

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
