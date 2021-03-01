Rails.application.routes.draw do

  root to: 'app#top'
  
  resources :app do
    collection do
      get 'top'
    end
  end

  resources :managements do
    collection do
      get 'top'
      get 'items'
      get 'orders'
    end
  end

  resources :items do
    resources :stocks, only: [:edit, :update]
  end

  resources :orders, only: [:new, :create, :index] do
    resources :reviews, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :rooms, only:[:create, :index] do
    resources :messages, only: [:create, :index]
  end

  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  devise_for :sellers, controllers: {
    sessions:      'sellers/sessions',
    passwords:     'sellers/passwords',
    registrations: 'sellers/registrations'
  }


  resources :sellers, only: :show

  resources :users do
    resources :charges, only: [:new, :create, :edit, :update]
  end

end
