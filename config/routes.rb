Rails.application.routes.draw do
 
  devise_for :users
 root to: "questions#index"

 resources :questions do
 		resources :answers, only: [:create]
 		resources :comments
 end

 resources :answers do
    resources :comments
    
  end
 
end
