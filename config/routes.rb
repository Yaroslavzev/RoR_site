Rails.application.routes.draw do
  resources :searches
  devise_for :users
  resources :users
  root 'events#index'
  resources :events #, only: [:index , :show ]

  get 'some_another_url', to: 'events#index'
  resources :comments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
