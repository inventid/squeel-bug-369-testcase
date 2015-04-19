Rails.application.routes.draw do

  resources :shops, only: [:index]

  resources :users, only: [] do
    resources :shops, only: [:index]
  end

end
