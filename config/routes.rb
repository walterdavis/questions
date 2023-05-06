Rails.application.routes.draw do
  resources :questionnaires do
    resources :sections, only: [:new, :create]
  end

  resources :sections, only: [] do
    resources :questions, only: [:new, :create]
  end

  root 'questionnaires#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
