Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  get '', to: 'api/v1/home#index', as: :home
  
  namespace :api do
    namespace :v1 do
      post :auth, to: 'authentication#create'
      get  '/auth' => 'authentication#fetch'
      
      scope 'products' do
        get '', to: 'products#index', as: :products
        get ':id', to: 'products#show', as: :products_show
        post '', to: 'products#store', as: :products_store
      end
      
    end
  end
end
