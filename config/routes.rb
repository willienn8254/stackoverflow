Rails.application.routes.draw do
 
  devise_for :users
 root to: "questions#index"

 resources :questions do
 		resources :answers, only: [:create]
 		resources :comments
 		resources :votes, only: [:create, :destroy]
 end

 resources :answers do
    resources :comments
    resources :votes, only: [:create, :destroy]
    
  end
 
end
