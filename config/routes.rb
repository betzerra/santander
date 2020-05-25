Rails.application.routes.draw do
  mount Lockup::Engine, at: '/lockup'

  resources :unit_trust_entries do
    collection do
      get :fetch
    end
  end

  resources :unit_trusts
  get '', to: 'utf#all'
  get 'detail/:id', to: 'utf#detail'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
