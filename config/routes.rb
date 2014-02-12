Timeline::Application.routes.draw do
  resources :articles, only:[:index, :show, :new, :create, :update]
  resources :events, only: [:index, :new, :create]
  resources :universes, only: [:show, :index]

  resources :article_forms, path: :articles
  resources :add_events_forms, path: :articles
  resources :event_forms, path: :events
end
