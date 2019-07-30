Rails.application.routes.draw do
<<<<<<< HEAD

  # # ORIGINAL
  # devise_for :users
  # root to: 'pages#home'
  # # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #   resources :paintings
  #   resources :bookings do
  #     resources :reviews, only: [:new, :create]
  #   end
  # end

  # TRYOUT
  devise_for :users

  resources :paintings do
    resources :review, only: [:new, :create]
  end

  resources :bookings, only: [:new, :create, :edit, :update, :show, :index]


=======
  get 'reviews/create'
  get 'reviews/new'
  devise_for :users
  resources :paintings do
    resources :reviews, only: [:new, :create]
  end
  resources :bookings, only: [:new, :create, :edit, :update, :show, :index]
  root to: 'pages#home'
>>>>>>> master
end
