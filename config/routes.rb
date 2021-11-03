Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'
  get 'welcome', to: 'welcome#index', as: 'welcome'
  resources :code, only: [:index, :show, :new, :create, :destroy]

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
