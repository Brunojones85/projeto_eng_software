class MedicosController < ApplicationController  
  before_action :authenticate_usuario!
  before_action :set_medico, only: [:show, :edit, :update, :destroy]
  # GET /medicos
  # GET /medicos.json

  def verifica_se_usuario_logado_e_admin
    @usuario_logado = current_usuario
    if @usuario_logado.nome != "admin"
      sign_out :usuario
      redirect_to "/usuarios/sign_in"
    end
  end
  
  def index
    puts "###[medicos_controller] def index..."
    verifica_se_usuario_logado_e_admin
    #redirect_to :root
    @medicos = Medico.all
  end

  # GET /medicos/1
  # GET /medicos/1.json
  def show
    verifica_se_usuario_logado_e_admin
  end

  # GET /medicos/new
  def new
    puts "###[medicos_controller.rb] def new..."
    verifica_se_usuario_logado_e_admin
    @medico = Medico.new
    @especialidade = Especialidade.all
  end

  # GET /medicos/1/edit
  def edit    
    puts "###[medicos_controller] def edit..."
    verifica_se_usuario_logado_e_admin
    @especialidade = Especialidade.all
  end

  # POST /medicos
  # POST /medicos.json
  def create
    puts "###[medicos_controller] def create..."
    verifica_se_usuario_logado_e_admin
    @medico = Medico.new(medico_params)
    @params = params #consultando parametros
    #PESSOAL, quando o botao do create new e pressionado precisamos dos parametros
    #pra poder ver se vieram especialidades no parametro.
    #la no form tem um esquema que prefixa com esp_ todas as especialidades checadas
    #entao a gente pega os parametros que comacam com esp_ e o valor do parametro e
    #justamente o id da especialidade.
    #Entao a gente usa esse id da especialidade pra dar um find e obter o registro dessa especialidade
    @params.each do |p|
      puts p
      if p[0].start_with?("esp_");
        esp = Especialidade.find(p[1]);
        @medico.especialidades << esp
      end      
    end

    respond_to do |format|
      if @medico.save
        format.html { redirect_to @medico, notice: 'Medico was successfully created.' }
        format.json { render :show, status: :created, location: @medico }
      else
        format.html { render :new }
        format.json { render json: @medico.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /medicos/1
  # PATCH/PUT /medicos/1.json
  def update
    puts "update..."
    verifica_se_usuario_logado_e_admin
    respond_to do |format|
      if @medico.update(medico_params)
        checa_se_ha_params_que_sao_especialidades_e_atribui_ao_medico(params)
        format.html { redirect_to @medico, notice: 'Medico was successfully updated.' }
        format.json { render :show, status: :ok, location: @medico }
      else
        format.html { render :edit }
        format.json { render json: @medico.errors, status: :unprocessable_entity }
      end
    end
  end

  def checa_se_ha_params_que_sao_especialidades_e_atribui_ao_medico(parametros)
    @params = parametros
    @params.each do |p|
      if p[0].start_with?("esp");
        esp = Especialidade.find(p[1]);
        @medico.especialidades << esp
      end                          
    end
  end
  
  # DELETE /medicos/1
  # DELETE /medicos/1.json
  def destroy
    verifica_se_usuario_logado_e_admin
    @medico.destroy
    respond_to do |format|
      format.html { redirect_to medicos_url, notice: 'Medico was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medico
      @medico = Medico.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def medico_params
      #fix-me
      #fiz isso para estudo...
      #params.require(:medico).permit(:nome, :crm, :local, :telefone, :celular, :email, :sexo, :situacao)
       params.require(:medico).permit!
    end
end
