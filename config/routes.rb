Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :members do
        resources :favorites, only: [:create, :destroy]
      end
      resources :items
    end
  end
end