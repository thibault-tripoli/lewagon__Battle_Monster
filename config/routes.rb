Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :battles, except: :index
  get 'profil/:id', to: 'pages#profil', as: :profil
end
