Rails.application.routes.draw do
  get 'skills/new'
  post 'skills/create'
  
  get 'greetings/new'
  post 'greetings/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "home/index"

  root "home#index"
end
