Rails.application.routes.draw do
  devise_for :users
  #get '/users/sign_out' => 'devise/sessions#destroy'
  root to: "pages#home"
  resources :battles, except: :index
  get 'profil/:id', to: 'pages#profil', as: :profil
end
