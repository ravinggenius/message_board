Rails.application.routes.draw do
  devise_for :identities

  root 'home#index'
end
