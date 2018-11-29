Rails.application.routes.draw do

  resources :agendamentos
  resources :medicos do
    resources :agendamentos
  end
  resources :locais

  get "/administrar", to: "telaadmin#index"

  get "/agendar", to: "consulta#index"
  get "/carrega_cidade" , to: "locais#carrega_cidade"
  get "/carrega_especialidades" , to: "agendamentos#carrega_especialidades"
  match "/realizar_agendamento" => "consulta#realizar_agendamento", :via => :post
  resources :especialidades
  devise_for :usuarios #do

  #Eu tava tentando estabelecer uma rota /usuarios/sign_out pro devise fazer logout
  #mas nao deu certo. Vou deixar comentado aqui o erro
  #    Then sou redirecionada para a pagina de login de usuario # features/step_definitions/cadastro_de_medico_steps.rb:102
  #    Could not find devise mapping for path "/usuarios/sign_out".
  #    This may happen for two reasons:
  #
  #    1) You forgot to wrap your route inside the scope block. For example:
  #
  #      devise_scope :user do
  #        get "/some/route" => "some_devise_controller"
  #      end
  #
  #
  #    2) You are testing a Devise controller bypassing the router.
  #       If so, you can explicitly tell Devise which mapping to use:
  #
  #       @request.env["devise.mapping"] = Devise.mappings[:user]
  #
  #     (AbstractController::ActionNotFound)
  #    ./features/step_definitions/steps_helper.rb:70:in `cria_convidado_nao_logado'
  #    ./features/step_definitions/cadastro_de_medico_steps.rb:103:in `"sou redirecionada para a pagina de login de usuario"'
  #    features/cadastro_de_medico.feature:43:in `Then sou redirecionada para a pagina de login de usuario'

  #Failing Scenarios:
  #cucumber features/cadastro_de_medico.feature:39 # Scenario: Acesso direto sem estar logado

  #devise_scope :user do
    #get "/usuarios/sign_out", to: "devise/sessions#destroy"
    #get "/usuarios/sign_out" => "devise/sessions#destroy"
  #end

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
