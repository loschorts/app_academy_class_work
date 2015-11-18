Rails.application.routes.draw do
  root to: 'cats#index'
  resources :cats do
    resources :cat_rental_requests, only: [:index]
  end

  resources :cat_rental_requests
end
