Rails.application.routes.draw do
  devise_for :users
  resources :paintings do
    resources :reviews, only: [:new, :create]
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:edit, :update, :show, :index]
  root to: 'pages#home'
end
