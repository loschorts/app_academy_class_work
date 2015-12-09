Rails.application.routes.draw do

  namespace :api do
    resources :todos do
      resources :steps, only: [:index, :create]
    end

    resources :steps
  end

  root to: 'pages#root'

end
