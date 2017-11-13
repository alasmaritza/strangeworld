Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#index'
  resources :compilations, only: [:index, :show]
  resources :subtopics, only: [:show]
  namespace :creator do
    resources :sections, only: [] do
      resources :subtopics, only: [:new, :create]
    end
    resources :compilations, only: [:new, :create, :show] do
      resources :sections, only: [:new, :create]
    end
  end
end
