Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  resources :books
  resources :users, only: [:index, :show, :edit, :update]
  get "home/about" => "homes#about"
  get "top" => "homes#top"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
