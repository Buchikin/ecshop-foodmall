Rails.application.routes.draw do

  resources :items
  
  resources :app do
    collection do
      get 'top'
    end
  end

  resources :managements do
    collection do
      get 'top'
    end
  end

  root to: 'app#top'

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
