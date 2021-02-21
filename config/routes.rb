Rails.application.routes.draw do

  resources :items
  
  resources :app do
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
end
