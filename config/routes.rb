Rails.application.routes.draw do
  root 'items#index'

  resources :items,  only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :users,  only: [:index, :show]


  namespace :api do
    namespace :v1 do
      resources :items, only: [:show, :create, :destroy]
    end
  end

  post "/search", to: "search#index"

end
