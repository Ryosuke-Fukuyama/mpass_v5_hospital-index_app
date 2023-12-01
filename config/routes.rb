Rails.application.routes.draw do
  resources :hospitals do
    collection do
      # match 'search' => 'hospitals#search', via: [:get, :post], as: :search
      # get 'maps'
    end
  end
  resources :hospital_labels, except: %i[show destroy]
  resource :admin, except: %i[index show destroy]
end
