Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :vehicle do
  	get 'door', to: 'door#index'
  	post 'engine/action', to: 'engine#create'
    get 'battery', to: 'battery#index'
		get 'fuel', to: 'fuel#index'
  end
end
