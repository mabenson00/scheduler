# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  devise_for :users

  get "up" => "rails/health#show", as: :rails_health_check
  root "home#index" # Set this to the controller and action you want to serve as the entry point

  # Defines the root path route ("/")
  # root "posts#index"
end
