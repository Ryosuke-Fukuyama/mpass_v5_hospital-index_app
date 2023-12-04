Rails.application.routes.draw do
  resources :hospitals, except: %i[show] do
    # collection do
      # match 'search' => 'hospitals#search', via: [:get, :post], as: :search
      # get 'maps'
    # end
  end
  resources :hospital_labels, only: %i[index create]
  resource :admin, only: %i[create edit update]
  resources :sessions, only: %i[create destroy]
end
