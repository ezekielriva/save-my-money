SaveMyMoney::Application.routes.draw do
  devise_for :users

  devise_scope :user do
    get "signup", to: "devise/registrations#new"
  end

  resources :coins
  resources :chests do
    resources :coins, module: 'chests'
  end

  root 'admin#dashboard'
end
