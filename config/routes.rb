Rails.application.routes.draw do
  get 'learns/index'
  root to: "learns#index"
end
