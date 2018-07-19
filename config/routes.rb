Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get '/logout', to: 'sessions#destroy'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  namespace :admin do
    resources :categories, only: [:index, :show, :new, :create, :destroy]
  end
  resources :ideas
  resources :images
  resources :users
end
