Rails.application.routes.draw do
  get  '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  post 'likes/:ballpark_log_id/create' => 'likes#create'
  delete 'likes/:ballpark_log_id/destroy' => 'likes#destroy'


  get 'users/:id/likes' => 'users#likes'

  root to: 'ballpark_logs#index'
  resources :ballpark_logs

  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
