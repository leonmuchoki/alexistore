Rails.application.routes.draw do
  root "welcome#index"

  resources :items

  resources :sales
end
