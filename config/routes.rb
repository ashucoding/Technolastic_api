Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :scores
      resources :users
    end
  end
end
