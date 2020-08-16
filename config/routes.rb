Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :meals, only: [:index, :create, :show, :update]
    resources :ingredients, only: [:index]
  end

end
