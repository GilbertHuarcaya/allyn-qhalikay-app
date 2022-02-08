Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "/create_doctor", to: "pages#create_doctor"
  patch "/update_doctor", to: "pages#update_doctor"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :records do
    collection do
      get :medical_histories
      get :patients_records
    end
    resources :medical_images, only: [:new, :create]
    resources :medical_results, only: [:new, :create]
    resources :prescriptions, only: [:new, :create]
  end
  resources :clinics do
    collection do
      get :search
    end
  end
end
