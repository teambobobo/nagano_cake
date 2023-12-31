Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  get "search" => "searches#search"
  get "genre/search" => "searches#genre_search"

  namespace :admin do
    resources :orders, only: [:show, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:create, :index, :edit, :update]
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
    root to: 'homes#top'
    patch 'order_details/:id' => 'order_details#update', as: 'order_details'
    get 'orders/index/:id' => 'orders#index', as: 'orders_index'
  end

  scope module: :public do
    resources :addresses, only: [:create, :index, :edit, :update, :destroy]
    get 'orders/complete' => 'orders#complete',as: "complete"
    resources :orders, only: [:new, :create, :index, :show]
    post 'orders/check' => 'orders#check'
    resources :cart_items, only: [:create, :index, :update, :destroy] do
      collection do
        delete 'destroy_all'
      end
    end
    get 'customers/mypage', to: 'customers#show'
    get 'customers/mypage/edit', to: 'customers#edit'
    patch 'customers/mypage', to: 'customers#update'
    get 'customers/check' => 'customers#check'
    patch 'customers/withdraw' => 'customers#withdraw'
    resources :items, only: [:index, :show]
    root to: 'homes#top'
    get 'about' => 'homes#about', as: 'about'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
