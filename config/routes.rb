Timeline::Application.routes.draw do
  resources :articles, only:[:index, :new, :create]
  resources :events, only: [:index, :new, :create]
  resources :universes, only: [:show, :index]

  resources :article_forms, path: :articles
  resources :event_forms, path: :events
end
