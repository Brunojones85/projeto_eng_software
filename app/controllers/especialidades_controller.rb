class EspecialidadesController < ApplicationController
  before_action :set_especialidade, only: [:show, :edit, :update, :destroy]

  # GET /especialidades
  # GET /especialidades.json
  def index
    @especialidades = Especialidade.all
  end

  # GET /especialidades/1
  # GET /especialidades/1.json
  def show
  end

  # GET /especialidades/new
  def new
    @especialidade = Especialidade.new
  end

  # GET /especialidades/1/edit
  def edit
  end

  # POST /especialidades
  # POST /especialidades.json
  def create
    @especialidade = Especialidade.new(especialidade_params)

    respond_to do |format|
      if @especialidade.save
        format.html { redirect_to @especialidade, notice: 'Especialidade was successfully created.' }
        format.json { render :show, status: :created, location: @especialidade }
      else
        format.html { render :new }
        format.json { render json: @especialidade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /especialidades/1
  # PATCH/PUT /especialidades/1.json
  def update
    respond_to do |format|
      if @especialidade.update(especialidade_params)
        format.html { redirect_to @especialidade, notice: 'Especialidade was successfully updated.' }
        format.json { render :show, status: :ok, location: @especialidade }
      else
        format.html { render :edit }
        format.json { render json: @especialidade.errors, status: :unprocessable_entity }
      end
    end
  end

  # foi retirado da tela  o delete pois caso o registro 
  # seja excluido , podera gerar incosistencia de dados 

  def destroy
    @especialidade.destroy
    respond_to do |format|
      format.html { redirect_to especialidades_url, notice: 'Especialidade was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Volta com as acoes realizadas
    def set_especialidade
      @especialidade = Especialidade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def especialidade_params
      params.require(:especialidade).permit(:Nome, :Descricao,:ativo)
    end
end
