Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check\
  # root to: redirect('/')
  root to: 'home#index'

  get '/', to: 'home#index'
  # Defines the root path route ("/")
  # root "posts#index"
  resources :transactions
  resources :accounts, only: %i[index new show create edit update delete] do
    # member do
    #   patch :index
    # end

    # collection do
    #   get :fees_edit
    # end
  end
end
