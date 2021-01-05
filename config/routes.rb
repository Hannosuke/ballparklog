Rails.application.routes.draw do
  get 'new/edit'
  get 'new/show'
  get  '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  post 'likes/:ballpark_log_id/create', to: 'likes#create'

  root to: 'ballpark_logs#index'
  resources :ballpark_logs

  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
