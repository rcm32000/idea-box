Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  delete '/logout', to: 'sessions#destroy'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  namespace :admin do
    get '/dashboard', to: 'base#dashboard'
    resources :categories, only: [:index, :show, :new, :create, :destroy]
    resources :images, only: [:index, :show, :new, :create, :destroy]
    resources :users, only: [:index, :new, :create, :show]
  end
  resources :users, except: [:index, :new, :create, :show] do
    resources :ideas
  end
end
