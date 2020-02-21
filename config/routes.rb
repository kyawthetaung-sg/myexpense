Rails.application.routes.draw do

  resources :themes
  get 'settings/index', as: 'settings'
  get 'settings/edit_language', as: 'edit_language'
  patch 'language/:id', to: 'settings#update_language', as: 'update_language'
  patch 'changed_theme/:id', to: 'settings#update_theme', as: 'change_theme'

  root 'homes#index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
