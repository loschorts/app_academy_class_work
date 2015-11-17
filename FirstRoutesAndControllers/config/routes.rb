Rails.application.routes.draw do
  resources :users do
    resources :contacts, only: [:index]
  end
  resources :contacts, only: [:show, :update, :create, :destroy]
  resources :contact_shares


end
