Rails.application.routes.draw do
  resources :searches
  devise_for :users
  root 'events#index'
  resources :events
  resources :users
  get 'some_another_url', to: 'events#index'
  resources :comments
  get 'home/index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
