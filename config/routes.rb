Rails.application.routes.draw do
  resources :users, only: [:create]

  resources :user_sessions, only: [:create]

  resources :infos, only: [:index]

  post 'logout' => 'user_sessions#destroy', :as => :logout
end
