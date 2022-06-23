Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :members do
        get 'favorite_items'
      end
      resources :items do
        get 'is_favorited_by'
        get 'favorite_members'
        resource :favorites, only: [:create, :destroy]
      end
    end
  end
end