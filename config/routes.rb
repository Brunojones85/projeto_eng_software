Rails.application.routes.draw do

 
  resources :especialidades
  devise_for :usuarios #do
  resources :usuarios
#    get 'sign_out', to: 'devise/sessions#destroy'
#  end
      	  #, controllers:{
 #   sessions: 'usuarios/sessions'
  #}
#

 # Rails.application.routes.draw do
  resources :especialidades
  #    devise_for :users, controllers: {
   #     sessions: 'users/sessions'
    #  }
#    end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
