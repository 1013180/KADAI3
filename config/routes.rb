Rails.application.routes.draw do
# root to: 'homes#top'
  root 'homes#top'
  devise_for :users
  get 'home/about' => 'homes#about'
  resources :users
  resources :books

  # do
  # endresources :users, only: [:show, :edit, :update]# resources :users, only: [:show, :edit]
  # resources :users, only: [:show, :edit, :update]
end
