Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :paintings do
    resources :reviews, only: [:new, :create]
  end
  resources :bookings, only: [:new, :create, :edit, :update, :show, :index]
end
