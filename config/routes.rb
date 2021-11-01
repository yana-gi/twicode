Rails.application.routes.draw do
  root 'code#index'
  resources :code, only: [:index, :show, :new, :create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
