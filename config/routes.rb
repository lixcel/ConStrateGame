Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'homes#top'
  devise_for :users

  resources :users, only:[:show, :index]

  resources :posts

  resources :tags, only: [:show]

end
