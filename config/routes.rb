Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items,only: [:new,:show,:create,:edit,:destroy,:updete,:index]
  resources :purchases,only:[:new]
  resources :cards,only:[:new]
  resources :deliveries,only:[:new]

end