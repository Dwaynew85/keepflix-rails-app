Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/update'
  get 'comments/destroy'
  root 'site#index'

  resources :movies do 
    resources :comments, only: [:create, :update, :destroy, :edit]
  end
  
  resources :users

  get '/signup' => 'users#new', as: 'signup'
  get '/login' => "sessions#new"
  post '/sessions' => "sessions#create"
  get '/logout' => "sessions#destroy"
  get '/auth/:provider/callback' => "sessions#create"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
