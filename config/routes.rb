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

  
  get 'users/mypage' => 'users#show'
  get 'users/information/edit' => 'users#edit'
  patch 'users/information' => 'users#update'
  get 'users/confirm_withdraw' => 'users#confirm_withdraw'
  patch 'users/withdraw' => 'users#withdraw'
  
  resources :posts, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :favorites, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :chats, only: [:create]
  resources :rooms, only: [:create, :show]
  resources :group_chats, only: [:create]
  resources :group_rooms, only: [:index, :create, :show]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
