Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  delete '/logout', to: 'sessions#destroy'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  namespace :admin do
    get '/dashboard', to: 'base#dashboard'
    resources :categories
    resources :images
    resources :users
    resources :ideas, only: [:index, :create, :show, :delete]
  end
  resources :users do
    resources :ideas
  end
end
