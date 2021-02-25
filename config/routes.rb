Rails.application.routes.draw do
  root to: 'ballpark_logs#index'
  
  get  '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get 'users/:id/likes' => 'users#likes'

  namespace :users do
    resources :passwords, only: [:new, :create, :edit, :update]
  end

  resources :ballpark_logs do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  post '/ballpark_logs/:ballpark_log_id/like/:id' => 'likes#destroy'

  resources :users
 
  namespace :api, format: 'json' do
    resources :games, only: :index
  end


  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end

end
