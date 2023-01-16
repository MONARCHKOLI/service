Rails.application.routes.draw do
  root "sessions#index"

  resources :users do
    resources :tasks do
      resources :workers
    end
  end

  
  
  resources :sessions, only: [:new,:index, :create, :destroy]
end
