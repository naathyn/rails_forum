Forum::Application.routes.draw do
  resources :users
  resources :sessions, :only => [:new, :create, :destroy]
  resources :boards, :only => :show do
    resources :topics, :except => :index
  end

  root :to => 'categories#index'

  match '/signup'   => 'users#new'
  match '/signin'   => 'sessions#new'
  match '/signout'  => 'sessions#destroy', :via => :delete
  match '/boards/:id' => 'topics#show', :as => :topic
end
