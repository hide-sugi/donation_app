Rails.application.routes.draw do
  get 'donations/index'
  root "donations#index"
  resources :donations, only: :index
end
