Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :battles, except: :index
  get 'profil/:id', to: 'pages#profil', as: :profil
  get 'templates/home'
  get 'templates/menu'
  get 'templates/profil'
  get 'templates/fake'
  get 'templates/combat'
end
