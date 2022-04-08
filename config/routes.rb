Rails.application.routes.draw do
  namespace :admin do
    get 'users/index'
    get 'users/edit'
  end
 # 会員用
# URL /users/sign_in ...
devise_for :users, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

namespace :admin do
  root to: "users#index" #管理者側TOPページ
  resources :users, only: [:index, :show, :edit, :update]
  resources :genres, only: [:index, :create, :edit, :update]
end

root to: "public/homes#top"
 end
