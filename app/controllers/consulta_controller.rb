class ConsultaController < ApplicationController
  before_action :prepare_ransack, only: [:index]

  def index
  end

  def realizar_agendamento
    usuario = Usuario.find(params[:usuario_id])
    agendamento = Agendamento.find(params[:agendamento_id])
    agendamento.usuario = usuario
    agendamento.save
    redirect_back(fallback_location: "/agendar")
  end

  def prepare_ransack
    @q = Agendamento.where(:usuario_id => nil).where("data >= ?", DateTime.now).ransack(params[:q])
    if params[:q] != nil and params[:q]["local_cidade_id_eq"] != '' and params[:q]["especialidade_id_eq"] != ''
      @agendamentos = @q.result.order(:data)
      cidade = Cidade.where(:id => params[:q]["local_cidade_id_eq"].to_s).take
      @estados = cidade.estado
      @local_cidade_id_eq = cidade.id
    else
      @error_message = "É necessário escolher o estado, cidade e especialidade médica para filtrar ! "
    end
  end
end
