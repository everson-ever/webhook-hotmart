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
      
      scope 'webhooks' do
        get '', to: 'webhooks#index', as: :webhooks
        post '', to: 'webhooks#store', as: :webhooks_store
        post ':id', to: 'webhooks#update', as: :webhooks_update
      end

    end
  end
end
