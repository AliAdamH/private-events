Rails.application.routes.draw do
  devise_for :users
  resources :events
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'events#index'
  resources :users, only: %i[show]
  resources :event_attendances, only: %i[new create destroy]
end
