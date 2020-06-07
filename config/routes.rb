Rails.application.routes.draw do
  resources :tasks, only: [:create, :index, :show]
  resources :users, only: [:create, :index]

  post '/login' => 'users#login'

  put '/complete' => 'tasks#complete'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
