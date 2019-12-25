Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#home'
  
  get 'static_pages/help'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts do
    member do
      put :up ,to:"posts#upvote"
      put :down ,to:"posts#downvote"
    end
  end
end
