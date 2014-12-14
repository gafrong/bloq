Rails.application.routes.draw do

  root "application#index"

  resources :designs, :only => [:index]
  resources :travels, :only => [:index]

  namespace :api, defaults: {format: :json} do
    namespace :v1 do  
      resources :designs, :only => [:index]
    end
  end

  namespace :api, defaults: {format: :json} do
    namespace :v2 do
      resources :travels, :only => [:index]
    end
  end
end
