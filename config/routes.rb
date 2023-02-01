Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users, 
  :controllers => { :registrations => 'registrations' },  
  :path => '/', 
  :path_names => { :sign_in => 'login', 
                   :sign_up => 'new', 
                   :sign_out => 'logout', 
                   :password => 'secret', 
                   :confirmation => 'verification' } 

  # Defines the root path route ("/")
  root "users#index"

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :new, :show, :create] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:create]
    end
  end

end
