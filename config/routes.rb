Rails.application.routes.draw do

  devise_for :users
  root to: "pages#home"


  # Battles
  resources :battles, only: %i[show create update] do
    get 'next_round/:id', to: 'battles#next_round', as: :next_round
    get "setup", to: 'battles#setup', as: :setup
    post 'accept', to: 'battles#accept'

    resources :decks, only: [:update]
    get "loading", to: 'battles#loading', as: :loading
  end
  # Connection -> match
  get 'connect', to: 'battles#connect'
  get 'users_connected', to: 'battles#users_connected'

  # Monsters
  resources :monsters, only: :create

  # Pages
  get "page/main", to: 'pages#main'
  get "page/start_intro", to: 'pages#start_intro'
  get "page/start_monster", to: 'pages#start_monster'
  get "page/start_tutoriel", to: 'pages#start_tutoriel'
  get "page/combats", to: "pages#combats"

  # Pages : Profil
  get 'profil/:id', to: 'pages#profil', as: :profil

  # Templates
  # get 'templates/container'
  # get 'templates/main'
  # get 'templates/master'
end
