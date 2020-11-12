Rails.application.routes.draw do
  devise_for :users, path_prefix: 'd', controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  devise_scope :user do
    get 'sign_in', to: 'users/sessions#new'
    get 'sign_up', to: 'users/registrations#new'
    get 'forgot_password', to: 'users/passwords#new'
    get 'reset_password', to: 'users/passwords#edit'
  end

  root to: 'application#home'

  resources :users do
    resources :adverts do
      resources :comments
      resources :responses
    end
  end

  get 'responses', to: 'responses#index'
end
