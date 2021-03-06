Rails.application.routes.draw do
  resources :ufs
  resources :ufcs
  resources :uccs
  resources :fiscals
  resources :carabineros
  resources :crime_witnesses
  resources :crime_victims
  resources :witnesses
  resources :victims
  devise_for :users
  root "crimes#index"
  resources :thiefs 
  resources :crimes
  resources :messages
  get "/search", to: "crimes#search"
  get 'newcrimethief', to: "crime_thiefs#new", as: 'new'
  get '/pronunciarse/:crime_id', to:"crimes#btop", as: 'btop'
  resources :crime_thiefs
  resources :crime_files
  resources :users

  post 'create_user' => 'users#create', as: :create_user

    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
