Rails.application.routes.draw do
# root to: 'homes#top'
  devise_for :users
  root 'homes#top'
  resources :users
  resources :books
  # do
  # end
# resources :users, only: [:show, :edit]
end
