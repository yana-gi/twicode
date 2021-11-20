Rails.application.routes.draw do
  root 'welcome#index'

  resources :code, only: [:show, :new, :create, :destroy]
  get 'users/:user_id/code', to: 'code#index', as: 'user_code_index'

  get 'welcome', to: 'welcome#index', as: 'welcome'
  get 'tos', to: 'welcome#tos', as: 'tos'
  get 'privacy_policy', to: 'welcome#privacy_policy', as: 'privacy_policy'

  get '/auth/:provider/callback', to: 'sessions#create'
  get "/auth/failure", to: "sessions#failure"
  get '/logout', to: 'sessions#destroy'
end
