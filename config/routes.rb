Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root 'sessions#new'

  resources :messages, only: [:index, :create]
  resources :sessions, only: [:new, :create]

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

end
