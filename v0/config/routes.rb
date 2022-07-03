Rails.application.routes.draw do
  resources :analog_recipes
  resources :digital_colors
  resources :analog_colors
  resources :packages, except: [:show]
  resources :users

  get '/packages/:id', id: /\d+/, to: 'packages#show'
  get '/packages/:slug', to: 'packages#show'
  post '/login', to: 'users#login'
  post '/validate', to: 'users#validate'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
