Timeline::Application.routes.draw do
  root :to => 'universes#index'

  resources :articles, only:[:index, :show, :new, :create, :update]
  resources :events, only: [:index, :show, :new, :create, :edit, :update] do
    member do
      get :duplicate
    end
  end
  resources :universes, only: [:show, :index]

  resources :article_forms, path: :articles
  resources :add_events_forms, path: :articles
  resources :event_forms, path: :events
end
