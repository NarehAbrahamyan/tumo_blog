Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root 'static_pages#home'
  
  get 'static_pages/help'
  get 'users/:id' => 'users#show'

  resources :posts
  get 'trending' ,to:"posts#trending"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts do
    post "comments",to:"comments#create"
    member do
      put :up ,to:"posts#upvote"
      put :down ,to:"posts#downvote"
    end
  end
end
