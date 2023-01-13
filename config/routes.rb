Rails.application.routes.draw do
  root "sessions#index"

  resources :users do
    resources :tasks
  end

  resources :workers
  
  resources :sessions, only: [:new,:index, :create, :destroy]
end
