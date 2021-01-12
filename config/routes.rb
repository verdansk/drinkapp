Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :users do
    resources :occassions
  end
  put '/occassions/:id/increment', to: 'occassions#increment', as: 'increment'
  # only: [:index, :show]
end
