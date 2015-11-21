Rails.application.routes.draw do
  resources :users
  resource :session

  resources :subs, except: [:destroy] do
    resources :posts
  end
end
