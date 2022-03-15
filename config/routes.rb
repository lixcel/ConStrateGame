Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'homes#top'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }

  resources :users, only:[:show, :index] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

  resources :posts do
    resources :comments, only: [:create,:destroy]
  end

  resources :tags do
    get 'posts', to: 'posts#search'
  end

  get "search" => "searches#search"

end
