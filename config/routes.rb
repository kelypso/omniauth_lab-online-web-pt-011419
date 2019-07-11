Rails.application.routes.draw do
  resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  get '/auth/facebook/callback' => 'sessions#create'
  
  resources :users
  resources :sessions, only: [:new, :create]
end
