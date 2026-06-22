Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      devise_for :users,
                 path: "",
                 path_names: {
                   sign_in: "login",
                   sign_out: "logout",
                   registration: "signup"
                 },
                 controllers: {
                   sessions: "api/v1/users/sessions",
                   registrations: "api/v1/users/registrations"
                 }

      # Current authenticated user
      get "me", to: "users#me"

      # Admin-only user management
      namespace :admin do
        resources :users, only: %i[
          index
          show
          create
          update
          destroy
        ]
      end
      resources :customers
      resources :products
      resources :sales_orders do
        resources :sales_order_lines
      end
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
