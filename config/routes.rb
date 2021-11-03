Rails.application.routes.draw do
  root 'welcome#index'
  resources :code, only: [:show, :new, :create, :destroy]
  get 'users/:user_id/code', to: 'code#index', as: 'user_code_index'

  get 'welcome', to: 'welcome#index', as: 'welcome'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
