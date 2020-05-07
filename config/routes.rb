Rails.application.routes.draw do
  resources :unit_trusts
  get 'fci/all'
  get 'fci/detail'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
