Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  
  root to: 'category#index'
  resources :category
  
  root to: 'status#index'
  resources :status
  
  root to: 'delivery_fee#index'
  resources :delivery_fee
  
  root to: 'prefecture#index'
  resources :prefecture
  
  root to: 'delivery#index'
  resources :delivery
end
