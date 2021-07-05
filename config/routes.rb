Rails.application.routes.draw do
  get 'searches/search'
  root to: 'homes#top'
  devise_for :users
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  resources :users, only: [:index, :show, :edit, :update] do
   member do
     get :followeds, :followers
   end
  end

  resources :relationships, only: %I[create destroy]
  # post "relationships/:id" => "relationships#create"
  # delete "relationships/:id" => "relationships#destroy"

  get "home/about" => "homes#about"
  get "top" => "homes#top"

  get '/search' => 'searches#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
