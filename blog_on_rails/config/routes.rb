Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get('/', {to: 'posts#index', as: 'root'})

  resources :users, only: [:new, :create, :edit, :update]
  resource :sessions, only: [:new, :destroy, :create]

  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

end
