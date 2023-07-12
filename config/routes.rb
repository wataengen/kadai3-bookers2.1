Rails.application.routes.draw do
  root to: 'homes#index'
  devise_for :users
  get 'homes/about' => 'homes#about'
  resources :homes, only: [:index,:show]
  resources :books, only: [:new, :create, :edit, :show, :index]
  resources :users, only:[:index, :show, :edit]

  delete 'books/:id' => 'books#destroy', as: 'destroy_books'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
