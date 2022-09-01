Rails.application.routes.draw do
  devise_for :users
  # get '/users/sign_out' => 'devise/sessions#destroy'
  get "/users/sign_up", to: "devise/registrations#new"
  root to: "pages#home"

  # Battles
  resources :battles, only: %i[show create update] do
    get 'next_round/:id', to: 'battles#next_round', as: :next_round
    get "setup", to: 'battles#setup', as: :setup
    get "loading", to: 'battles#loading', as: :loading
  end
  get "match", to: 'battles#match', as: :match

  # Monsters
  resources :monsters, only: :create

  # Pages
  get "page/main", to: 'pages#main'
  get "page/start_intro", to: 'pages#start_intro'
  get "page/start_monster", to: 'pages#start_monster'
  get "page/start_tutoriel", to: 'pages#start_tutoriel'
  get "page/combats", to: "pages#combats"
  get "page/fake", to: "pages#fake"
  get "/users/sign_up", to: "devise/registrations#new"

  # Pages : Profil
  get 'profil/:id', to: 'pages#profil', as: :profil
  get 'profil/:id/edit', to: 'pages#edit'

  # Templates
  get 'templates/home'
  get 'templates/menu'
  get 'templates/profil'
  get 'templates/fake'
  get 'templates/combats'
  get 'templates/campagnes'
  get 'templates/monsterplace'
  get 'templates/monsterdex'
  get 'templates/inscription'

end
