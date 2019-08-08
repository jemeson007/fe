Rails.application.routes.draw do
  devise_for :humen
  get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # devise_for :humen

  resources :properties

  root 'welcome#index'
end
