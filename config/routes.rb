Rails.application.routes.draw do
  devise_for :identities

  resources :posts

  root 'home#index'
end
