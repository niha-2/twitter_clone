# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users,
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations',
               omniauth_callbacks: 'users/omniauth_callbacks'
             }

  devise_scope :user do
    post 'users/sign_in', to: 'users/sessions#create'
    post 'users/sign_up', to: 'users/registrations#create'
    delete 'users/sign_out', to: 'users/sessions#destroy'
  end

  resources :tasks
  resources :pages, only: [:index]
  resources :user_profiles, only: %i[show edit update]
  resources :tweets, only: %i[create show] do
    resource :likes, only: %i[create destroy]
  end
  resources :comments, only: %i[create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'pages#index'

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
