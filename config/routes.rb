Rails.application.routes.draw do
  resources :unit_trust_entries do
    collection do
      get :fetch
    end
  end
  resources :unit_trusts
  get 'fci/all'
  get 'fci/detail'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
