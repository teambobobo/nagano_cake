Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  namespace :admin do
    resources :orders, only: [:show, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:create, :index, :edit, :update]
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
    get 'top' => 'homes#top', as: 'top'
  end


    resources :addresses, only: [:create, :index, :edit, :update, :destroy]
    resources :orders, only: [:new, :create, :index, :show]
    post 'orders/check' => 'orders#check'
    get 'orders/complete' => 'orders#complete'
    resources :cart_items, only: [:create, :index, :update, :destroy] do
      collection do
        delete 'destroy_all'
      end
    end
    resources :customers, only: [:show, :edit, :update]
    get 'customers/check' => 'customers#check'
    patch 'customers/withdraw' => 'customers#withdraw'
    resources :items, only: [:index, :show]
    root to: 'homes#top'
    get 'about' => 'homes#about', as: 'about'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
