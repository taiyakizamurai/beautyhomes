Rails.application.routes.draw do
  devise_for :admin, controllers: {
  sessions: "admin/sessions"
  }
  devise_for :customers, controllers: {
    sessions: "customers/sessions",
    registrations: "customers/registrations"
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

      namespace :admins do
    resources :trouble
    resources :maker
    resources :items
    resources :customers
    get '/homes'=> 'homes#top'
  end
    namespace :public do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
    get '/homes'=> 'homes#top'
    resources :makers
    resources :items
    resources :cart_items
    resources :orders
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
end
end