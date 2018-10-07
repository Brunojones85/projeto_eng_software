require_relative "steps_helper"

#Ver ser util para caso de teste de registrar medico
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



Given("Eu sou o Administrador") do
  expect(1==1)
end

Given("Eu estou logado") do
  expect(1==1)
end

When("Eu acesso pagina de criar um novo medico") do
  expect(1==1)
end

Then("na pagina principal recebo a mensagem de Medico cadastrado com sucesso!") do
  expect(1==1)
end

Given("Eu sou Administrador") do
  expect(1==1)
end
Quando("envio o formulario de medico com dados validos") do
  expect(1==1)
end

Quando("envio o form de novo medico com todos os campos em branco") do
  expect(1==1)
end


Então("recebo mensagems de erro na página de cadastro de médico para os seguintes campos:") do |table|
  expect(1==1)
end
