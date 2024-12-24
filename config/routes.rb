Rails.application.routes.draw do
  get 'courses/', to: 'courses#index'
  get 'courses/new'
  get 'courses/:id', to: 'courses#show'
  get 'courses/:id/edit', to: 'courses#edit'
  post 'courses', to: 'courses#create'
  patch 'courses/:id', to: 'courses#update', as: 'course'
  delete 'courses/:id', to: 'courses#destroy', as: 'delete_course'


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
