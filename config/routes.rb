Rails.application.routes.draw do
  resources :reports do
    resources :articles
  end
  
  namespace :api, { format: 'json' } do
    namespace :v1 do
      post 'webhook', to: 'webhooks#create'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
