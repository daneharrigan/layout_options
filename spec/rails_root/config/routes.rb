RailsRoot::Application.routes.draw do
  resources :foo
  resources :bar do
    resources :baz
  end
end
