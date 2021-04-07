Rails.application.routes.draw do
  get 'messages/index'
  get 'relearns/new'
  devise_for :users
  get 'learns/index'
  root to: "learns#index"

  resources :learns do
    resources :relearns, only: [:new, :create, :show]
    resources :messages, only: [:index]
    resources :rooms, only: [:new, :create]
  end
  

end
