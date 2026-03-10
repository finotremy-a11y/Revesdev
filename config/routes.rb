Rails.application.routes.draw do
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  get "up" => "rails/health#show", as: :rails_health_check

  # Authentification native Rails 8
  resource :session
  resources :passwords, param: :token

  # Espace public
  root "pages#home"
  get "about", to: "pages#about"
  get "services", to: "pages#services"
  get "mentions-legales", to: "pages#mentions_legales", as: :mentions_legales
  get "politique-de-confidentialite", to: "pages#politique_confidentialite", as: :politique_confidentialite
  get "cgu", to: "pages#cgu", as: :cgu
  get "sitemap.xml", to: "pages#sitemap", as: :sitemap, defaults: { format: :xml }

  # Portfolio
  resources :projects, only: [ :index, :show ], path: "portfolio"

  # Formulaire de contact public
  resources :contacts, only: [ :new, :create ], path: "contact" do
    member do
      get :confirmation
    end
  end

  # Espace d'administration protégé
  namespace :admin do
    root to: "dashboard#index"
    resources :projects, except: [ :show ]
    resources :contacts, only: [ :index, :show, :destroy ]
  end
end
