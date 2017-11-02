Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  root controller: :restaurants, action: :index

  resources :restaurants do
    resources :reviews
  end

  resources :dishes
  resources :charges
  resources :carts do
    get :remove_item
    get :clear_cart
  end

  get '/add_to_cart/:id', controller: :carts, action: :add, as: :add_to_cart

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :restaurants, only: [:index, :show]
      mount_devise_token_auth_for 'User', at: 'auth',
                                  skip: [:omniauth_callbacks],
                                  controllers: {
                                      sessions: 'api/v1/sessions',
                                      registrations: 'api/v1/registrations'
                                  }
    end
  end
end


