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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
