Rails.application.routes.draw do
devise_for :users
root to: 'items#index'
resources :items, only: [:index,:new,:create,:show,:edit, :update,:destroy] do
  root to: 'orders#index'
  resources :orders, only:[:index,:create]do
end
end
end