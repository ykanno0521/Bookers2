Rails.application.routes.draw do
  get 'books/index'
	devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
	get '/home/about' => 'home#about'
  resources :books
  resources :users
  resources :profile_images, only: [:create]
end
