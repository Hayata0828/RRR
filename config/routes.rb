Rails.application.routes.draw do

  get 'admin_products/index'

  root 'home#top'

  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
  }
  devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :products do
    resource :orders,only:[:show, :create]
  end
  resources :users
  resources :admins
  resources :admin_products
  resources :orders, only:[:index]
  get 'admin_product/:id/destroy_check' => 'admin_products#destroy_check'
  get ':id/order_check' => 'orders#order_check'

end
