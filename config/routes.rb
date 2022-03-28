Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'homes#top'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }

  resources :users, only:[:show] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
    member do
      get :likes
      get :bookmarks
      get :posts
    end
  end

  resources :posts do
    resources :comments, only: [:create, :destroy]
    resource :bookmarks, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

  resources :tags do
    get 'posts', to: 'posts#search'
  end

  get "search" => "searches#search"

end
