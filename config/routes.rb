Rails.application.routes.draw do
  root 'items#index'
  resources :items,only: :show
  resources :purchases,only:[:new]
  resources :cards,only:[:new]
  resources :deliveries,only:[:new]
end