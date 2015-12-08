Rails.application.routes.draw do

  namespace :api do
    resources :todos
  end
  root 'pages#root'
  match '/root' => 'pages#root'

end
