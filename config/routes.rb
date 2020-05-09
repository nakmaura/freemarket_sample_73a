Rails.application.routes.draw do
  get 'buyers/index'
  get 'buyers/done'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'destinations', to: 'users/registrations#new_destination'
    post 'destinations', to: 'users/registrations#create_destination'
  end
  root 'items#index'
  resources :items,only:[:index,:new,:create,:show,:edit]do
    resources :purchases, only: [:index] do
      collection do
        get 'done', to: 'purchases#done'
        post 'pay', to: 'purchases#pay'
      end
    end
   end
  resources :cards,only:[:new,:create]
  resources :mypages_cards,only:[:index,:new]
  resources :deliveries,only:[:new,:create]
  resources :logout,only:[:index]
  resources :users,only:[:show]
  resources :cards, only: [:new, :show, :destroy] do
    collection do
      post 'pay', to: 'cards#pay'
    end
  end
end