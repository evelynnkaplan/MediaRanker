Rails.application.routes.draw do
  root "pages#index"

  resources :works

  resources :users, except: [:new, :create]
  get "/login", to: "users#login_form", as: "login"
  post "/login", to: "users#login"
  post "/logout", to: "users#logout", as: "logout"
end
