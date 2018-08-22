Rails.application.routes.draw do
  namespace :admin do
    get 'stages/index'
  end

  namespace :user do
    get 'referrals/index'
  end

  devise_for :user, controllers: {registrations: "user/registrations",
    sessions: "user/sessions", passwords: "user/passwords"}

  devise_for :admin, controllers: {sessions: "admin/sessions",
    passwords: "admin/passwords"}

  devise_scope :admin do
    get "admin/login", to: "admin/sessions#new"
    get "admin/logout", to: "admin/sessions#destroy"
  end

  devise_scope :user do
    get "login", to: "user/sessions#new"
    get "logout", to: "user/sessions#destroy"
    get "register", to: "user/registrations#new"
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
    get "/stages", to: "stages#index"
  end
  get '*path' => redirect('/')
end
