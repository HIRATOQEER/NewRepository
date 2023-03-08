Rails.application.routes.draw do
  devise_for :user2s
  
  root "contacts#index"

    resources :contacts

end
