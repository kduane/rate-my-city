Rails.application.routes.draw do
  root 'cities#index'
  devise_for :users
  resources :users, :reviews
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :cities do
    resources :reviews, only: [:index, :new, :create]
  end

  resources :reviews do
    resources :votes, only: [:new, :create]
  end



end
