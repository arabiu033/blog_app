Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users
  root "users#index"

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :new,  :destroy, :show, :create] do
      resources :comments, only: [:index, :new, :create, :destroy]
      resources :likes, only: [:create]
    end
  end

end
