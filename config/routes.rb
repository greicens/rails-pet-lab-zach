Rails.application.routes.draw do

  root "site#index"

  resources :owners do
  resources :pets, only: [:index, :new, :create]
  resources :owners, except: [:new]
   end
  resources :pets, only: :show

   get "/signup" => "owner#new"


end
