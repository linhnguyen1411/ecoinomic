Rails.application.routes.draw do
  devise_for :admins
  namespace :user do
    get 'referrals/index'
  end

  devise_for :users, controllers: {registrations: "users/registrations",
    sessions: "users/sessions", passwords: "users/passwords"}

  devise_scope :user do
    get "login", to: "devise/sessions#new"
    get "logout", to: "devise/sessions#destroy"
    get "register", to: "devise/registrations#new"
  end

  root to: "landing/landings#index", as: :user_root
  scope module: "landing" do
    resources :landings
  end

  scope module: "user" do
    resources :users
    get "/faq", to: "faqs#index"
    get "/profile", to: "users#show"
    get "/change_password", to: "users#change_password"
    put "/change_password", to: "users#change_password"
    get "/dashboard", to: "dashboards#index"
    get "/referrals", to: "referrals#index"
    resources :verifies, only: [:index, :update]
  end

  scope module: "admin", path: "admin", as: :admin do
    resources :admins
    get "/dashboard", to: "dashboards#index"
  end
end
