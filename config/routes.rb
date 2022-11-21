Rails.application.routes.draw do
  get 'addresses/new'
  get 'addresses/index'
  get 'addresses/edit'
  get 'addresses/create'
  get 'addresses/update'
  get 'addresses/destroy'
 # 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
root to: 'public/homes#top'
get '/about' => 'public/homes#about'
get '/customers/unsubscribe' => 'public/customers#unsubscribe'
patch '/customers/withdraw' => 'public/customers#withdraw' 
  scope module: :public do
      delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
      post '/orders/confirm' => 'orders#confirm'
      get '/orders/complete' => 'orders#complete'
      resources :items, only: [:index, :show]
      resources :customers, only: [:show, :edit, :update]
      resources :cart_items, only: [:index, :update, :destroy, :create]
      resources :orders, only: [:new, :create, :index, :show]
      resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end
# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
#get 'admin' => 'admin/homes#top'
 namespace :admin do
   root to: 'homes#top'
   resources :items, only: [:index, :new, :create, :show, :edit, :update]
   resources :genres, only: [:index, :create, :edit, :update]
   resources :customers, only: [:index, :show, :edit, :update]
   resources :orders, only: [:show, :update]
   resources :order_details, only: [:update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
