Rails.application.routes.draw do
  devise_for :identities

  resources :posts, except: :destroy do
    resources :replies, only: :create
  end

  root 'home#index'
end
