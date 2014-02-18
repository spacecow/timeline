Timeline::Application.routes.draw do
  root :to => 'universes#index'

  resources :articles, only:[:index, :show, :new, :create, :edit, :update] do
    member do
      put :update_events
    end
  end
  resources :events, only: [:index, :show, :new, :create, :edit, :update] do
    member do
      put :update_articles
      get :duplicate
    end
  end
  resources :universes, only: [:show, :index]

  resources :article_forms, path: :articles
  resources :event_forms, path: :events
end
