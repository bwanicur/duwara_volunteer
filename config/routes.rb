Rails.application.routes.draw do
  namespace :admin do
    resources :volunteers
    resources :events
  end

  resources :events, only: [:get, :index]
  resources :invitations, only: [:get, :create, :update]
  resources :volunteers, only: [:create]

  root to: 'events#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
