Rails.application.routes.draw do
  resources :tasks, only: [:create, :index, :show, :put, :destroy]
  resources :users, only: [:create, :index]

  post '/login' => 'users#login'

  post '/signup' => 'users#create'

  put '/complete' => 'tasks#complete'

  put '/undo' => 'tasks#undo'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
