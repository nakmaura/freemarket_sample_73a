Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items
  resources :purchases,only:[:new]
  resources :cards,only:[:new,:create]
  resources :mypages_cards,only:[:index,:new]
  resources :deliveries,only:[:new,:create]
  resources :logout,only:[:index]
  resources :users,only:[:show]
end