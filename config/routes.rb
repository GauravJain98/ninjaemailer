Rails.application.routes.draw do
  root 'welcome#index'
  resources :tickets
  resources :tickets do
    resources :comments
  end
  # resources :admins
  # resources :agents
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
