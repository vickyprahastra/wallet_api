Rails.application.routes.draw do
  root to: "home#index"

  get 'login',  to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'
  resource :session, only: [:create]
end
