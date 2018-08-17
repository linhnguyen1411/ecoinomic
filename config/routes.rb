Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "landing/landings#index", as: :user_root
  scope module: 'landing' do
    resources :landings
  end
  scope module: 'user' do
    resources :users
    get "/faq", to: "faqs#index"
  end
end
