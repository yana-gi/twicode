Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'
  get 'welcome', to: 'welcome#index', as: 'welcome'
  resources :code, only: [:index, :show, :new, :create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
