Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :battles, except: :index do
    get '/next_round/:id', to: 'battles#next_round', as: :next_round
  end
  get 'profil/:id', to: 'pages#profil', as: :profil
end
