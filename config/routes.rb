Rails.application.routes.draw do
  root "pages#index"

  resources :works

  resources :users, except: :new
end
