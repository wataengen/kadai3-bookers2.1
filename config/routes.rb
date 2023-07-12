Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#index'
  get 'homes/about' => 'homes#about'
  resources :homes, only: [:index,:show]
  resources :books, only: [:index, :show, :edit, :new, :create]
  resources :users, only: [:index, :show, :edit]

  patch 'books/:id/update' => 'books#update', as: 'update_books'
  patch 'users/:id/update' => 'users#update', as: 'update_users'
  delete 'books/:id' => 'books#destroy', as: 'destroy_books'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
