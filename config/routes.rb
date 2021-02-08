Rails.application.routes.draw do
  root to: 'ballpark_logs#index'
  
  get  '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get 'users/:id/likes' => 'users#likes'

  resources :ballpark_logs do
    resources :likes, only: [:create, :destroy]
  end

  resources :users
 
  namespace :games do 
    resources :searches, only: :index, defaults: { format: :json }
  end

end
