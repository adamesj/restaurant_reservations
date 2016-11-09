Rails.application.routes.draw do
  devise_for :users

  resources :restaurants do
    resources :reservations
    put :favorite, on: :member
  end

  authenticated :user do
    root :to => "users#dashboard", :as => "authenticated_root"
  end

  root :to => 'restaurants#index'
end
