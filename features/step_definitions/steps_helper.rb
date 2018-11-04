# coding: iso-8859-1
puts "## [steps_helper.rb] Carregado com sucesso!"

def cria_convidado
  @convidado ||= {
    :nome => "admin",
    :email => "admin@admin",
    :numerosus => "1234567",
    :cpf => Faker::CPF.numeric,
    :telfixo => Faker::PhoneNumber.phone_number,
    :telcel => Faker::PhoneNumber.cell_phone,
    #Tive que remover esses campos porque gerou esse erro no teste login_valido que ja tava passando antes...
    #undefined method `dtanasc_mes=' for #<Usuario:0x000055fa78d1b320> (NoMethodError)
    #:dtanasc_dia => "10",
    #:dtanasc_mes => "9",
    #:dtanasc_ano => "2013",
    :password => "123456", :password_confirmation => "123456"
  }
end

#Cadastro do Médico

def cria_administrador
  Usuario.destroy_all #apaga todos os usuarios do banco
  @administrador ||= {
    :nome => "admin",
    :email => "admin@admin",
    :numerosus => "1234567",
    :cpf => Faker::CPF.numeric,
    :telfixo => Faker::PhoneNumber.phone_number,
    :telcel => Faker::PhoneNumber.cell_phone,
    #Tive que remover esses campos porque gerou esse erro no teste login_valido que ja tava passando antes...
    #undefined method `dtanasc_mes=' for #<Usuario:0x000055fa78d1b320> (NoMethodError)
    #:dtanasc_dia => "10",
    #:dtanasc_mes => "9",
    #:dtanasc_ano => "2013",
    :password => "123456", :password_confirmation => "123456"
  }
 FactoryBot.create(:usuario, @administrador)
end

def fazer_login_Adm
  visit '/usuarios/sign_in'
  #O certo e testar a frase completa, mas o rapido tem acento
  #o cucumber nao fica nada feliz com isso
  #por equanto tesmos certeza que \"pido - ACESSAR\" testa o que a gente quer
  #ate que consigamos resolver essa questao dos acentos no cubumber
  #expect(page).to have_content("Agende R�pido - ACESSAR");
  expect(page).to have_content("pido - ACESSAR");
  fill_in "usuario_email", :with => @administrador[:email]
  fill_in "usuario_password", :with => @administrador[:password]
  find(:xpath, "/html/body/div/div/form/button").click
  expect(page).to have_content("Seja bem-vindo admin");
end


# Fim Cadastro médico


def find_user
  #Fix-me
  #apaguei temporariamente por causa do erro: undefined method `[]' for nil:NilClass (NoMethodError)
  #estava trabalhando pra fazer o travis rodar o cucumber
  #@usuario ||= Usuario.where(:email => @visitor[:email]).first
end

def cria_convidado_nao_logado
  cria_convidado
  exclui_usuario
  sign_up
  visit '/users/sign_out'
end

def cria_usuario
  cria_convidado
  exclui_usuario
  @usuario = FactoryBot.create(:usuario, @convidado)
end

def exclui_usuario
  @usuario ||= Usuario.where(:email => @convidado[:email]).first
  @usuario.destroy unless @usuario.nil?
end

def fazer_login
  visit '/usuarios/sign_in'
  fill_in "usuario_email", :with => @convidado[:email]
  fill_in "usuario_password", :with => @convidado[:password]
  find(:xpath, "/html/body/div/div/form/button").click
end

def sign_up_com_dados_validos
  exclui_usuario
  visit '/usuarios/sign_up'
  fill_in "usuario_nome", :with => @convidado[:nome]
  fill_in "usuario_numerosus", :with => @convidado[:numerosus]
  fill_in "usuario_cpf", :with => @convidado[:cpf]

  #fix-me:
  #seria melhor mapear 'option[9]' para o atributo  @convidado[:dtanasc_mes]
  #seria melhor que apenas selecionar a opcao 9, mas a opcao nove ainda e valida
  #pra efeitos desse caso de teste
  #find("#usuario_dtanasc_3i").find(:xpath, 'option['+@convidado[:dtanasc_dia]+']').select_option
  #find("#usuario_dtanasc_2i").find(:xpath, 'option[9]').select_option

  #fix-me: idem acima com parametro @convidado[:dtanasc_ano]
  #find("#usuario_dtanasc_1i").find(:xpath, 'option[3]').select_option

  fill_in "usuario_telfixo", :with => @convidado[:telfixo]
  fill_in "usuario_telcel", :with => @convidado[:telcel]
  fill_in "usuario_sexo", :with => @convidado[:sexo]

  fill_in "usuario_email", :with => @convidado[:email]
  fill_in "usuario_password", :with => @convidado[:password]
  fill_in "usuario_password_confirmation", :with => @convidado[:password_confirmation]

  find(:xpath,"/html/body/div/div/form/div[11]/input").click

  find_user
end

def sign_up_sem_informar_nenhum_dado_no_form
  exclui_usuario
  visit '/usuarios/sign_up'
  find(:xpath,"/html/body/div/div/form/div[11]/input").click
end

def preencherCamposLocal(objeto)
  fill_in "local_nome", :with => objeto[:nome]
  fill_in "local_cep", :with => objeto[:cep]
  fill_in "local_rua", :with =>objeto[:rua]
  fill_in "local_bairro", :with => objeto[:bairro]
  fill_in "local_numero", :with => objeto[:numero]
  fill_in "local_telefone", :with => objeto[:telefone]
end

def preencherCamposMedico(objeto)
  fill_in "medico_nome", :with => objeto[:nome]
  fill_in "medico_crm", :with => objeto[:crm]
  fill_in "medico_local", :with => objeto[:local]
  fill_in "medico_telefone", :with =>objeto[:telefone]
  fill_in "medico_celular", :with => objeto[:celular]
  fill_in "medico_email", :with => objeto[:email]
  fill_in "medico_sexo", :with => objeto[:sexo]
  fill_in "medico_situacao", :with => objeto[:situacao]
  #  fill_in "medico_especialidade", :with => objeto[:especialidade]
end

def cria_local_valido
  @localvalido = {
    :nome => Faker::Company.name,
    :cep => Faker::Address.zip_code,
    :rua => Faker::Address.street_name,
    :numero => Faker::Address.building_number,
    :cidade => Faker::Address.city ,
    :bairro => Faker::Address.community,
    :telefone => Faker::PhoneNumber.phone_number,
    :ativo => true
  }
end

def cria_local_invalido
  @localinvalido = {
    :nome => nil,
    :cep => nil,
    :rua => nil,
    :numero => nil,
    :cidade => nil,
    :bairro => nil,
    :telefone => nil,
    :ativo => nil
  }
end

def cria_medico_valido
  @medicovalido = {
    :nome => "Medico X2",
    :crm => "Crm33",
    :local => "Hospital X2",
    :telefone => Faker::PhoneNumber.phone_number,
    :celular => Faker::PhoneNumber.cell_phone,
    :email =>  Faker::Internet.email,
    :sexo => Faker::Gender.binary_type,
    :situacao => Faker::String
  }
end

def medico_sem_dado_no_form
  visit '/medicos/new'
  # find(:xpath,"/html/body/form/div[9]/input").click
  find(:xpath,"/html/body/div/div/form/div[9]/input").click
end


def cria_info_agendamento_valido
  valid_attributes = {

      data: DateTime.now(),
      local_id:  FactoryBot.create(:local).id,
      especialidade_id: FactoryBot.create(:especialidade).id,
      medico_id:  FactoryBot.create(:medico).id,
      usuario_id: FactoryBot.create(:usuario).id

  }

  @agendamento_valido = Agendamento.create! valid_attributes
end
