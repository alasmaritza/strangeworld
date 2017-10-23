Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'static_pages#index'
  resources :compilations, only: [:index, :show]
  namespace :creator do
    resources :compilations, only:[:new, :create, :show]
  end
end
