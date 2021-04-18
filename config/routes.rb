Rails.application.routes.draw do
  get 'messages/index'
  get 'relearns/new'
  devise_for :users
  get 'learns/index'
  root to: "learns#index"

#  resources :learns do
#    resources :relearns, only: [:new, :create, :show]
#    resources :rooms, only: [:new, :create, :destroy] do
#      resources :messages, only: [:index, :create]
#    end
#  end
  
  resources :learns do
    resources :relearns, only: [:new, :create, :show]
    collection do    #追加
      get 'search'   #
    end              #
    resources :rooms, only: [:new, :create, :destroy] do
      resources :messages, only: [:index, :create]
    end
  end

end