class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nome, :numerosus, :cpf, :telfixo, :dtanasc, :telcel, :sexo])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nome, :numerosus, :cpf, :telfixo, :dtanasc, :telcel, :sexo])


  end
	
end
