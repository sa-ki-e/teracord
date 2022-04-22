Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  scope module: :public do
    root to: "homes#top"
    get "about" => "homes#about"
    post 'guest_sign_in' => 'homes#guest_sign_in'
    resources :users, only: [:show]
    resources :posts do
      resource :likes, only: [:create, :destroy]
      resources:comments, only: [:create, :destroy]
      collection do
        get "search"
      end
    end
  end


  namespace :admin do
    #root to: "users#index" #管理者側TOPページ
    resources :users, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :posts, only: [:index, :show, :destroy]
    resources :comments, only: [:destroy]
  end
end
