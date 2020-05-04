Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'destinations', to: 'users/registrations#new_destination'
    post 'destinations', to: 'users/registrations#create_destination'
  end
  root 'items#index'
  resources :items
  resources :purchases,only:[:new]
  resources :cards,only:[:new,:create]
  resources :mypages_cards,only:[:index,:new]
  resources :deliveries,only:[:new,:create]
  resources :logout,only:[:index]
  resources :users,only:[:show]
end