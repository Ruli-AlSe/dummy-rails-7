Rails.application.routes.draw do
  get 'courses/', to: 'courses#index', as: 'courses_index'
  get 'courses/new', as: 'courses_new'
  get 'courses/:id', to: 'courses#show'
  get 'courses/:id/edit', to: 'courses#edit'
  post 'courses', to: 'courses#create'
  patch 'courses/:id', to: 'courses#update', as: 'course'
  delete 'courses/:id', to: 'courses#destroy', as: 'delete_course'


  # routes for tests
  post "/search" => "pokemons#search"


  get 'skills/new', as: 'skills_new'
  post 'skills/create', as: 'skills_create'
  
  get 'greetings/new', as: 'greetings_new'
  post 'greetings/create', as: 'greetings_create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "home/index"

  root "pokemons#index"
end
