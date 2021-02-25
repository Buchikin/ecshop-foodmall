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
    end
  end

  resources :items
  resources :stocks, only: [:edit, :update]

  

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
end
