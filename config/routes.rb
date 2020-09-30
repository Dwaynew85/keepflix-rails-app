Rails.application.routes.draw do
  root 'site#index' # or application#welcome
  resources :movies
  resources :users
  get '/login' => "sessions#new"
  post '/sessions' => "sessions#create"
  get '/logout' => "sessions#destroy"
  get '/auth/:provider/callback' => "sessions#create"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
