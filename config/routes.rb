Rails.application.routes.draw do
  root 'home#top'

  resources :code, only: [:show, :new, :create, :destroy]
  resources :code, only: [:index], path: 'users/:user_id/code', as: 'user_code'

  get 'home', to: 'home#top', as: 'home'
  get 'welcome', to: 'welcome#index', as: 'welcome'
  get 'tos', to: 'welcome#tos', as: 'tos'
  get 'privacy_policy', to: 'welcome#privacy_policy', as: 'privacy_policy'

  get '/auth/:provider/callback', to: 'sessions#create'
  get "/auth/failure", to: "sessions#failure"
  get '/logout', to: 'sessions#destroy'
end
