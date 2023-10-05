Rails.application.routes.draw do
  get 'group_rooms/show'
  get 'group_rooms/index'
  get 'rooms/show'
  get 'posts/index'
  get 'posts/show'
  get 'posts/edit'
  get 'homes/top'
  get 'homes/about'
  get 'users/show'
  get 'users/edit'
  get 'users/confirm_withdraw'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
