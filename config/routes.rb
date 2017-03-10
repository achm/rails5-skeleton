Rails.application.routes.draw do
  get '/help', to:'home#help'
  get '/about', to:'home#about'
  get  'home/about'
  root to: 'home#index'
end
