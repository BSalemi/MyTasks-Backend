Rails.application.routes.draw do
  resources :tasks, only: [:create, :index]
  resources :users, only: [:create, :index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
