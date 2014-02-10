Timeline::Application.routes.draw do
  resources :articles, only:[:index, :new, :create]
end
