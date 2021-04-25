Rails.application.routes.draw do
  get 'messages/index'
  get 'relearns/new'
  devise_for :users
  get 'learns/index'
  root to: "learns#index"
  get 'messages/:id', to: 'messages#checked'


#  resources :learns do
#    collection do    #追加
#      get 'search'   #
#    end             #
#    resources :relearns, only: [:new, :create, :show] 
#    resources :rooms, only: [:new, :create, :destroy] do
#      resources :messages, only: [:index, :create]
#    end
#  end

  resources :learns do
    collection do    #追加
      get 'search'   #
    end             #
    resources :relearns, only: [:new, :create, :show] do
      resources :rooms, only: [:new, :create, :destroy] do
        resources :messages, only: [:index, :create, :checked]
      end
    end
  end
end