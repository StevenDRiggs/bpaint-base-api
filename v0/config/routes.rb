Rails.application.routes.draw do
  resources :digital_colors
  resources :analog_colors
  resources :recipes
  resources :packages
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
