Store::Application.routes.draw do
  devise_for :users
  root 'static_pages#index'

  resources :products
end
