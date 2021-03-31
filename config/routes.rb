Rails.application.routes.draw do
  get 'relearns/new'
  devise_for :users
  get 'learns/index'
  root to: "learns#index"

  resources :learns do
    resources :relearns, only: :new
  end
  

end
