Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  get '', to: 'api/v1/home#index', as: :home
  
  namespace :api do
    namespace :v1 do
      post :auth, to: 'authentication#create'
      get  '/auth' => 'authentication#fetch'
      
      
    end
  end
end
