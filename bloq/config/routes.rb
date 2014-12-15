Rails.application.routes.draw do

  root "application#index"

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

  namespace :api, defaults: {format: :json} do
    namespace :v3 do
      resources :foods, :only => [:index]
    end
  end

  namespace :api, defaults: {format: :json} do 
    namespace :v4 do 
      resources :techs, :only => [:index]
    end
  end
  # resources :designs, :only => [:index]
  # resources :travels, :only => [:index]
  # resources :foods, :only => [:index]
  # resources :techs, :only => [:index]
end
