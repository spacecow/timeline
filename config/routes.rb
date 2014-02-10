Timeline::Application.routes.draw do
  resources :articles, only:[:index, :new, :create]
  resources :events, only: [:index, :new, :create]

  resources :article_forms, path: :articles
  resources :event_forms, path: :events
end
