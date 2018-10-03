require_relative "steps_helper"

#Ver ser util para caso de teste de registrar usuario
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


Given("Eu sou convidado") do
  cria_convidado
end

When("Eu acesso pagina de criar uma nova conta") do
  visit '/usuarios/sign_up'
end

When("envio o formulario com dados validos") do
  sign_up_com_dados_validos
end

Then("na pagina principal recebo a mensagem de Seja bem-vindo com o nome do meu usuario") do
  expect(page).to have_content("Seja bem-vindo "+ @convidado[:nome])
end

When("envio o form de nova conta com todos os campos em branco") do
  #Aqui, antes de enviar o form eu nao preencho nada
  sign_up_sem_informar_nenhum_dado_no_form
end

Then("recebo mensagems de erro para os seguintes campos:") do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  sign_up_sem_informar_nenhum_dado_no_form
  linhas = table.raw
  linhas.each do |linha|
    puts  "#{linha[0]} em branco"
    #expect(page).to assert_text(linha )
    #expect(page.text).to match(/(fieldName)/)
    page.assert_text(/#{linha[0]}/)
  end
end

When("preencho o campo nome with {string}") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

When("preencho o campo numero sus com um numero que ja existe no sistema") do
  pending # Write code here that turns the phrase above into concrete actions
end

When("preencho o campo de cpf com um cpf que ja existe no sistema") do
  pending # Write code here that turns the phrase above into concrete actions
end

When("preencho o email com um email que ja e utilizado por outro usuario do sistema") do
  pending # Write code here that turns the phrase above into concrete actions
end

When("preencho a senha") do
  pending # Write code here that turns the phrase above into concrete actions
end

When("confirmo a senha") do
  pending # Write code here that turns the phrase above into concrete actions
end

When("clico no botao enviar") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("devo receber as mensagens") do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  pending # Write code here that turns the phrase above into concrete actions
end
