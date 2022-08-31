Rails.application.routes.draw do
  devise_for :users
  #get '/users/sign_out' => 'devise/sessions#destroy'
  root to: "pages#home"
  resources :battles, except: :index do
    get '/next_round/:id', to: 'battles#next_round', as: :next_round
  end
  get 'profil/:id', to: 'pages#profil', as: :profil

  get "page/main", to: 'pages#main'
  get "page/start_intro", to: 'pages#start_intro'
  get "page/start_monster", to: 'pages#start_monster'
  get "page/start_tutoriel", to: 'pages#start_tutoriel'


  get 'templates/home'
  get 'templates/menu'
  get 'templates/profil'
  get 'templates/fake'
  get 'templates/combat'

end
