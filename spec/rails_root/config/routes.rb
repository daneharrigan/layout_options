RailsRoot::Application.routes.draw do
  resources :cux
  resources :foo
  resources :bar do
    resources :baz
  end
end
