Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks" }

  resources :restaurants do
    resources :reservations
    put :favorite, on: :member
  end

  authenticated :user do
    root :to => "users#dashboard", :as => "authenticated_root"
  end

  get '/users/my_stars', to: 'users#my_stars'

  root :to => 'restaurants#index'
end
