Rails.application.routes.draw do
  
  resources :memes, only: [:create]

end
