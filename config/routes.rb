Rails.application.routes.draw do
  root to: 'home#index'
  get '/help', to:'home#help'
  get '/about', to:'home#about'
  get '/contact', to: 'home#contact'
  get '/signup',  to: 'users#new'
  resources :users
end
