require_relative "steps_helper"


# Cenario: Cadastro realizado com sucesso (Caminho Feliz)
  
Given("Eu sou o Administrador") do
  cria_administrador
end

Given("Eu sou Administrador") do
  cria_administrador
end


Given("Eu estou logado") do
  cria_administrador
  fazer_login_Adm
end

When("Eu acesso pagina de criar um novo medico") do
   cria_administrador
   fazer_login_Adm
   visit '/medicos/new'
   expect(page).to have_content("Cadastrar Novo Medico");
end

When("envio o formulario de medico com dados validos") do
  cria_administrador
  fazer_login_Adm
  visit '/medicos/new'
  expect(page).to have_content("Cadastrar Novo Medico");
  cria_medico_valido
  preencherCamposMedico(@medicovalido)
#  find(:xpath, "/html/body/form/div[9]/input").click
  find(:xpath, "/html/body/div/div/form/div[9]/input").click
end

Then("na pagina principal recebo a mensagem de Medico cadastrado com sucesso!") do
  cria_administrador
  fazer_login_Adm
  visit '/medicos/new'
  cria_medico_valido
  preencherCamposMedico(@medicovalido)
  # find(:xpath, "/html/body/form/div[9]/input").click
  find(:xpath, "/html/body/div/div/form/div[9]/input").click
  expect(page).to have_content("Medico was successfully created.")
end

# Cenario: Cadastro com dados obrigatorios faltando

#ambiguidade com Eu sou administrador la em cima
#Given("Eu sou Administrador") do
#  cria_administrador
#  fazer_login_Adm
#end

When ("envio o form de novo medico com todos os campos em branco") do
  cria_administrador
  fazer_login_Adm
  visit '/medicos/new'
  medico_sem_dado_no_form
 # find(:xpath, "/html/body/form/div[9]/input").click

end

Then ("recebo mensagems de erro na pagina de cadastro de medico para os seguintes campos:") do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  medico_sem_dado_no_form
  linhas = table.raw
  linhas.each do |linha|    
    expect(page).to have_content(linha[0])
  end
end


# Cenario: Acesso direto sem estar logado
   

Given("Eu sou um convidado") do
  cria_convidado
end

#Considerado ambiguo com Eu nao estou logado em usuarios
#Given("Eu nao estou logado") do
#  cria_convidado
#  visit '/users/sign_out'
#end

#Given("Eu acesso pagina de criar um novo medico") do
#  cria_convidado
#  visit '/users/sign_out'
#  visit '/medicos/new'
#end



#Ambiguo com frase acima
#Then("recebo mensagem de erro na pagina de cadastro de medico") do
#  pending # Write code here that turns the phrase above into concrete actions
#end

Then("sou redirecionada para a pagina de login de usuario") do
  cria_convidado
  visit '/'
  find(:xpath,"/html/body/div[2]/div/div[1]/a[4]").click;        
  visit '/medicos/new'
  expect(page).to have_content("pido - ACESSAR");
  expect(page).to have_content("Esqueceu sua senha?");
  expect(page).to have_content("Criar sua conta");
end

