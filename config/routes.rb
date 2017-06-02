Rails.application.routes.draw do
  root 'users#index'
  resources :users
  resources :sessions , only: [:new,:create,:destroy]

  resource :questions , exept: [:show,:new,:index]
  get 'sign_up' => 'users#new'
  get 'log_out' => 'sessions#destroy'
  get 'log_in' => 'sessions#new'
  get 'delete_account'=>  'users#destroy'
end
