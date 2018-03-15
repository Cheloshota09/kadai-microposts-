Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sesions#new'
  post 'login', to: 'session#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'user#new'
  resources :users, only: [:index, :show, :new, :create]
end
