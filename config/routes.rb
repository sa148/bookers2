Rails.application.routes.draw do
 root to: 'homes#top'
 devise_for :users
 get "/homes/about" => "homes#about", as: "about"
 resources :books, only: [:new, :create, :show, :edit, :destroy]
 resources :users, only: [:new, :show,  :create, :edit, :destroy]
 # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
