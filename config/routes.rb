Rails.application.routes.draw do
  resources :hospitals do
    # collection do
      # match 'search' => 'hospitals#search', via: [:get, :post], as: :search
      # get 'maps'
    # end
  end
  resources :hospital_labels, only: %i[index create]
  resource :admin, except: %i[index new destroy]
  resources :sessions, only: %i[create destroy]
end
