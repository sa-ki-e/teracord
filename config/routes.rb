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
    resources :posts do
      resources:comments, only: [:create, :destroy]
    end
      # get 'posts/new'
      # get 'posts/index'
      # get 'posts/show'
      # get 'posts/edit'
      # get "posts/create"
  end
    # namespace :admin do
    #   get 'users/index'
    #   get 'users/edit'
    # end

  namespace :admin do
    root to: "users#index" #管理者側TOPページ
    resources :users, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
  end
end
