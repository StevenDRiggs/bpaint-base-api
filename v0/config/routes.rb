Rails.application.routes.draw do
  resources :digital_colors
  resources :analog_colors
  resources :analog_recipes
  resources :packages
  resources :users

  post '/login', to: 'users#login'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
