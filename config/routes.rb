Rails.application.routes.draw do

  resources :agendamentos
  resources :medicos do
    resources :agendamentos
  end
  resources :locais
  get "/carrega_cidade" , to: "locais#carrega_cidade"
  get "/carrega_especialidades" , to: "agendamentos#carrega_especialidades"
  resources :especialidades
  devise_for :usuarios #do

  resources :usuarios do
    resources :agendamentos
  end

  #devise_scope :usuario do
  #  get '/signout', to: 'devise/sessions#destroy', as: :signout
  #end

  #    get 'sign_out', to: 'devise/sessions#destroy'
#  end
      	  #, controllers:{
 #   sessions: 'usuarios/sessions'
  #}
#

 # Rails.application.routes.draw do
  resources :medicos
  resources :locais
  #    devise_for :users, controllers: {
   #     sessions: 'users/sessions'
    #  }
#    end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
