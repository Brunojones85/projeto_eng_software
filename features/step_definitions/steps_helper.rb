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

def find_user
  @usuario ||= User.where(:email => @visitor[:email]).first
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

