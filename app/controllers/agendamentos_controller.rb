class AgendamentosController < ApplicationController
  before_action :set_agendamento, only: [:show, :edit, :update, :destroy]
  before_action :find_medico, only:[:index]
  before_action :find_paciente, only:[:index]


  def carrega_especialidades
    medico_id = params[:id].to_i
    #@estado = Estado.find(estado_id)
    #@cidades = @estado.cidades.collect { |c| [c.nome, c.id] }
    #render :layout => false
    medico = Medico.find(medico_id)
    especialidades = medico.especialidades
    esp = []
    especialidades.each do |especialidade|
      esp << {:id => especialidade.id, :n => especialidade.Nome}
    end
    render :json => {:esp => esp.compact}.as_json
  end


  # GET /agendamentos
  # GET /agendamentos.json
  def index
    medico = params[:medico_id]
    usuario = params[:usuario_id]
    if medico != nil
      @agendamentos = Agendamento.where(:medico_id => medico)
    elsif usuario != nil
      @agendamentos = Agendamento.where(:usuario_id => usuario)
    else
      @agendamentos = Agendamento.all
    end
  end

  # GET /agendamentos/1
  # GET /agendamentos/1.json
  def show
  end

  # GET /agendamentos/new
  def new
    @agendamento = Agendamento.new
  end

  # GET /agendamentos/1/edit
  def edit

    @especialidade = @agendamento.especialidade.id
  end

  # POST /agendamentos
  # POST /agendamentos.json
  def create
    @agendamento = Agendamento.new(agendamento_params)

    respond_to do |format|
      if @agendamento.save
        format.html { redirect_to @agendamento, notice: 'Agendamento was successfully created.' }
        format.json { render :show, status: :created, location: @agendamento }
      else
        format.html { render :new }
        format.json { render json: @agendamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /agendamentos/1
  # PATCH/PUT /agendamentos/1.json
  def update
    respond_to do |format|
      if @agendamento.update(agendamento_params)
        format.html { redirect_to @agendamento, notice: 'Agendamento was successfully updated.' }
        format.json { render :show, status: :ok, location: @agendamento }
      else
        format.html { render :edit }
        format.json { render json: @agendamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agendamentos/1
  # DELETE /agendamentos/1.json
  def destroy
    @agendamento.destroy
    respond_to do |format|
      format.html { redirect_to agendamentos_url, notice: 'Agendamento was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agendamento
      @agendamento = Agendamento.find(params[:id])
    end

    def find_paciente
      @usuario = Usuario.find(params[:usuario_id]) unless params[:usuario_id].nil?
    end
    def find_medico
      @medico = Medico.find(params[:medico_id]) unless params[:medico_id].nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def agendamento_params
      params.require(:agendamento).permit(:data, :local_id, :especialidade_id, :medico_id, :usuario_id)
    end
end
