Rails.application.routes.draw do
  root 'site#index'

  resources :movies do 
    resources :comments, only: [:create, :update, :destroy, :edit]
  end
  get '/movies_trending' => 'movies#trending', as: 'trending'
  
  resources :users

  get '/signup' => 'users#new', as: 'signup'
  get '/login' => "sessions#new"
  post '/sessions' => "sessions#create"
  get '/logout' => "sessions#destroy"
  get '/auth/facebook/callback' => 'sessions#create'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
