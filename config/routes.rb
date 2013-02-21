Forum::Application.routes.draw do
  resources :boards, :only => :show do
    resources :topics, :comments, 
      :only => [:show, :create, :destroy]
  end
  root :to => 'categories#index'
end
