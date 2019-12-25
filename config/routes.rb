Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  
  get 'static_pages/help'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts
end
