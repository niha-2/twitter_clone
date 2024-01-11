# frozen_string_literal: true

Rails.application.routes.draw do
  get 'pages/show'
  devise_for :users,
    controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    }

  devise_scope :user do
    post 'users/sign_in', to: 'users/sessions#create'
    post 'users/sign_up', to: 'users/registrations#create'
    delete 'users/sign_out', to: 'users/sessions#destroy'
  end

  resources :tasks
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#index"
end
