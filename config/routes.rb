Rails.application.routes.draw do

  devise_for :users
    resources :users, only: [:update, :show, :index, :edit]

  root 'welcome#index'

  get 'about' => 'welcome#about'

    resources :topics
    resources :bookmarks

end