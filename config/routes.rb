Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :records do
    collection do
      get :medical_histories
    end
    resources :medical_image, only: [:create]
    resources :medical_result, only: [:create]
    resources :prescription, only: [:create]
  end
  resources :rentals, only: [:destroy, :show, :update, :edit] do
    collection do
      get :my_rentals
      patch "/:id/complete", to: "rentals#complete", as: "complete"
    end
  end
end
