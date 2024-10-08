Rails.application.routes.draw do
  # get "bookings/index"
  # get "bookings/new"
  # get "bookings/create"
  # get "bookings/edit"
  # get "bookings/update"
  devise_for :users
  # get "car/show"
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  resources :cars, only: [:index, :show, :new, :create] do
    resources :ratings, only: [:create]

    resources :bookings, only: [ :new, :create]
  end
  resources :bookings, only: [:index, :edit, :update] do
    member do
      get :accept
      get :decline
    end
  end

end
