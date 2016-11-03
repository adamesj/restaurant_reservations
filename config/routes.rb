Rails.application.routes.draw do
  devise_for :owners
  resources :restaurants do
    resources :reservations
  end
  root 'restaurants#index'
  get 'owners/dashboard' => 'owners#dashboard'
end
