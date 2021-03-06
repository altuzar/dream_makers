Rails.application.routes.draw do
  resources :emails, only: [:create]
  resources :dreams, except: [:destroy, :edit, :update] do
    member do
      get :report
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
