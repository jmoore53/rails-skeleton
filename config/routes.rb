Rails.application.routes.draw do
  devise_for :admins, :skip => :registration
  devise_for :users, controllers: {
    sessions: 'users/sessions', 
    registrations: 'users/registrations', 
    confirmations: 'users/confirmations'
  }

  authenticated :admin do
    devise_for :admins, only: [:registrations], controllers: { registrations: 'admins/registrations' }
    root to: "admins#show", as: :authenticated_admin
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'staticpages#index'
  get 'about', to: 'staticpages#about'
end
