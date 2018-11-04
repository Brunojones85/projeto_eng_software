class ConsultaController < ApplicationController
  def index
    @q = Agendamento.where(:usuario_id => nil).where("data >= ?", DateTime.now).ransack(params[:q])
    if params[:q] != nil and params[:q]["local_cidade_id_eq"] != '' and params[:q]["especialidade_id_eq"] != ''
      @agendamentos = @q.result.order(:data)
      cidade = Cidade.where(:id => params[:q]["local_cidade_id_eq"].to_s).take
      @estado = cidade.estado
      @local_cidade_id_eq = cidade.id
    else
      @error_message = "É necessário escolher o estado, cidade e especialidade médica para filtrar ! "
    end
  end
end
