Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get '/'         => 'pages#index'
  get '/contact'  => 'pages#contact'

  resources :products, only: %i[index show] do
    collection do
      get :cart
      get :checkout
    end
  end

  root to: redirect('/'), as: 'root'
  
  get '*path'     => 'pages#not_found'
end
