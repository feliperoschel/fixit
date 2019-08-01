Rails.application.routes.draw do
  get 'profiles/show'
  devise_for :users
  resources :paintings do
    resources :reviews, only: [:new, :create]
    resources :bookings, only: [:new, :create]

  end
  resources :bookings, only: [:edit, :update, :show, :index]
   resources :profiles, only: [:show]
  root to: 'pages#home'
end
