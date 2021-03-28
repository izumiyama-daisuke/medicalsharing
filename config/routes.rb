Rails.application.routes.draw do
  devise_for :users
  get 'learns/index'
  root to: "learns#index"

  resources :learns, only: [:index, :new, :create, :show, :edit]
  

end
