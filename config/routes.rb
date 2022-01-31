Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :records do
    collection do
      get :medical_histories
    end
    resources :medical_images
    resources :medical_results
    resources :prescriptions
  end
  resources :clinics do
    collection do
      get :search
    end
  end
end
