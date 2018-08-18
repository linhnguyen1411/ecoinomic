Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "users/registrations",
    sessions: "users/sessions"}

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
  end
end
