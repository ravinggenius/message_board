Rails.application.routes.draw do
  devise_for :identities

  resources :posts do
    resources :replies, only: [ :new, :create ]
  end

  root 'home#index'
end
