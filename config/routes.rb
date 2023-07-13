Rails.application.routes.draw do

  get 'home/about'
  devise_for :users
  root to: 'homes#index'
  get 'home/about' => 'homes#about'
  get 'homes/index' => 'homes#index', as: 'home'
  resources :books, only: [:index, :show, :edit, :update, :new, :create, :destroy]
  resources :users, only: [:index, :show, :edit, :update]


  # patch 'books/:id/update' => 'books#update', as: 'update_books'
  # patch 'users/:id/update' => 'users#update', as: 'update_users'
  # delete 'books/:id' => 'books#destroy', as: 'destroy_books'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
