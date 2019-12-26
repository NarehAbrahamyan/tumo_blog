Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  
  get 'static_pages/help'
  resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts do
    post "comments",to:"comments#create"
    member do
      put :up ,to:"posts#upvote"
      put :down ,to:"posts#downvote"
    end
  end
end
