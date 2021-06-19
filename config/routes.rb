Rails.application.routes.draw do
  get '', to: 'home#index', as: :home

  namespace :api do
    namespace :v1 do
      
    end
  end
end
