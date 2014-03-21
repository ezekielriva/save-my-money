SaveMyMoney::Application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations'}

  devise_scope :user do
    get "signup", to: "devise/registrations#new"
  end

  root 'welcome#index'
end
