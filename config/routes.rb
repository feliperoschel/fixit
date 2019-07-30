Rails.application.routes.draw do
<<<<<<< HEAD
 devise_for :users
 resources :paintings do
   resources :reviews, only: [:new, :create]
 end
 resources :bookings, only: [:new, :create, :edit, :update, :show, :index]
 root to: 'pages#home'
=======
  devise_for :users
  resources :paintings do
    resources :reviews, only: [:new, :create]
  end
  resources :bookings, only: [:new, :create, :edit, :update, :show, :index]
  root to: 'pages#home'
>>>>>>> master
end
