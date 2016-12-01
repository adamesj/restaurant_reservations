Rails.application.routes.draw do
  get 'pages/index'

  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks" }


  resources :searches, only: [:create]

  resources :restaurants do
    resources :reservations
    put :favorite, on: :member
  end

  get '/restaurants/:id/:name' => 'restaurants#show', :as => :restaurant_with_title

  resources :categories

  authenticated :user do
    root :to => "users#dashboard", :as => "authenticated_root"
  end

  get '/users/my_stars', to: 'users#my_stars'

  root :to => 'pages#index'
end
