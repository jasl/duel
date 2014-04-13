Rails.application.routes.draw do
  resources :subjects

  root to: 'home#index'
  get 'about' => 'home#about'

  devise_for :users, :controllers => {:omniauth_callbacks => 'omniauth_callbacks'}
end
