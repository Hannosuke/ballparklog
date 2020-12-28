Rails.application.routes.draw do
  root to: 'ballpark_logs#index'
  resources :ballpark_logs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
