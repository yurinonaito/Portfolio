Rails.application.routes.draw do
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
  
  resources :users, only:[:show, :edit, :index, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
    
    member do
    get :favorites
    end
  end
  
  
  resources :posts, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  
  resources :rooms, only: [:create, :show] do
    resources :chats, only: [:create]
  end

  resources :group_rooms, only: [:index, :create, :show] do
    resources :group_chats, only: [:create, :show]
  end
  
  
end
