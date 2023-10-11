Rails.application.routes.draw do
  get 'notifications/index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: "homes#top"
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  } 
  
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  
  get 'homes/about'

  get 'users/information/edit' => 'users#edit'
  patch 'users/information' => 'users#update'
  get 'users/confirm_withdraw' => 'users#confirm_withdraw'
  patch 'users/withdraw' => 'users#withdraw'
  
  get 'searches/search'
  get '/post/hashtag/:name', to: "posts#hashtag"
  
  resources :users, only:[:show, :edit, :index, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
    get :favorites, on: :collection
    member do
      patch 'nonrelease'
    end
  end
  
  
  resources :posts, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
    member do
    post 'teachme'
    end
  end
  
  resources :rooms, only: [:create, :show] do
    resources :chats, only: [:create]
  end

  resources :group_rooms, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :group_chats, only: [:create, :show]
  end
  
  resources :notifications, only: [:index, :destroy]
  
end
