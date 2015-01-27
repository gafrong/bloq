Rails.application.routes.draw do

  devise_for :users
  root "application#index"

  namespace :api, defaults: {format: :json} do
    namespace :v1 do  
      resources :designs, :only => [:index]
      resources :travels, :only => [:index]
      resources :foods, :only => [:index]
      resources :techs, :only => [:index]
    end
  end

end
