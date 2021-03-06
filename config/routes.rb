Rails.application.routes.draw do
  resources :subjects do
    resources :challenges, only: [:create] do
      member do
        post 'good'
        post 'bad'
      end
    end
  end

  root to: 'home#index'
  get 'about' => 'home#about'

  devise_for :users, :controllers => {:omniauth_callbacks => 'omniauth_callbacks'}
end
