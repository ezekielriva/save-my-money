SaveMyMoney::Application.routes.draw do
  devise_for :users

  devise_scope :user do
    get "signup", to: "devise/registrations#new"
  end

  resources :chests do
    resources :coins
  end

  root 'welcome#index'
end
