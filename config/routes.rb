Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'login',            to: 'login#index'
  post 'login',           to: 'login#create'
  get 'log_out',          to: 'login#log_out'
  root 'login#index'
  resources :users
  resources :projects
  resources :events
  resources :teams
  resources :todos
  resources :comments
  resources :user_teams
end
