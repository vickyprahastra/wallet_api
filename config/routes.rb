Rails.application.routes.draw do
  root to: "home#index"

  get 'login',  to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'
  resource :session, only: [:create]

  namespace :api do
    get     'user',  to: 'sessions#show'
    delete  'logout', to: 'sessions#destroy'
    resource :session, only: [:create]

    post 'transfer', to: 'transactions#transfer'
    post 'withdraw', to: 'transactions#withdraw'
  end
end
