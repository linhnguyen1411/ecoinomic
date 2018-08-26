Rails.application.routes.draw do
  namespace :user do
    get 'buy_tokens/index'
  end

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
    resource :landings do
      collection do
        post "subcrible"
      end
    end
  end

  scope module: "user" do
    resources :users
    get "/faq", to: "faqs#index"
    get "/profile", to: "users#show"
    get "/change_password", to: "users#change_password"
    put "/change_password", to: "users#change_password"
    get "/dashboard", to: "dashboards#index"
    get "/referrals", to: "referrals#index"
    get "/buy_tokens", to: "buy_tokens#index"
    resources :verifies, only: [:index, :update]
  end

  scope module: "admin", path: "admin", as: :admin do
    resources :admins
    get "/dashboard", to: "dashboards#index"
    get "/stages", to: "stages#index"
    resource :stages do
      collection do
        post "create"
        get "load_data"
      end
    end
    resources :images
  end
  get '*path' => redirect('/')
end
