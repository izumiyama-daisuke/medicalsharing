Rails.application.routes.draw do
  devise_for :users
  get 'learns/index'
  root to: "learns#index"
end
