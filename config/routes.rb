Rails.application.routes.draw do
  devise_for :identities

  resources :posts do
    resources :replies, only: :create
  end

  root 'home#index'
end
