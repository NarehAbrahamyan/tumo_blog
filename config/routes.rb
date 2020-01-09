Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root 'static_pages#home'
  
  get 'static_pages/help'
  get 'users/:id' => 'users#show'

  resources :posts
  get 'yposts' ,to:"posts#yposts"
  get 'category0' ,to:"posts#category0"
  get 'category1' ,to:"posts#category1"
  get 'category2' ,to:"posts#category2"
  get 'category3' ,to:"posts#category3"
  get 'category4' ,to:"posts#category4"
  get 'category5' ,to:"posts#category5"
  get 'category6' ,to:"posts#category6"
  get 'category7' ,to:"posts#category7"
  get 'category8' ,to:"posts#category8"
  get 'category9' ,to:"posts#category9"
  get 'category10' ,to:"posts#category10"
  get 'category11' ,to:"posts#category11"
  get 'category12' ,to:"posts#category12"
  get 'category13' ,to:"posts#category13"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts do
    post "comments",to:"comments#create"
    member do
      put :up ,to:"posts#upvote"
      put :down ,to:"posts#downvote"
    end
  end
end
