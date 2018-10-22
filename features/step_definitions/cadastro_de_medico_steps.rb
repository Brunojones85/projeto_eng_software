
require_relative "steps_helper"

# Cenario: Cadastro realizado com sucesso (Caminho Feliz)
  
Given("Eu sou o Administrador") do
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
end

When("envio o formulario de medico com dados validos") do
  cria_administrador
  fazer_login_Adm
  visit '/medicos/new'
  cria_medico_valido
  preencherCamposMedico(@medicovalido)
  find(:xpath, "/html/body/form/div[9]/input").click

end

Then("na pagina principal recebo a mensagem de Medico cadastrado com sucesso!") do
  cria_administrador
  fazer_login_Adm
  visit '/medicos/new'
  cria_medico_valido
  preencherCamposMedico(@medicovalido)
  find(:xpath, "/html/body/form/div[9]/input").click
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
    puts  "#{linha[0]} em branco"
    expect(page).to assert_text(linha )
    expect(page.text).to match(/(fieldName)/)
    page.assert_text(/#{linha[0]}/)
  end
end


# Cenario: Acesso direto sem estar logado
   

Given("Eu sou um convidado") do
  cria_convidado
end

#Considerado ambiguo com Eu nao estou logado em usuarios
#Given("Eu nao estou logado") do
#  cria_convidado
#end

Then ("recebo mensagem de erro na pagina de cadastro de medico") do  
 # Verifica se esta logado, se nao estiver logado, mostra mensagem de erroexpect(1==1)
 # Nao sera necessario usar o comando    visit '/usuarios/sign_out'   devido ao erro 
 # "   Couldn't find Usuario with 'id'=sign_out (ActiveRecord::RecordNotFound)  "    

  visit '/medicos/new'
  expect(page).to have_content("Voce precisa estar logado para acessar esta pagina")
 # visit '/usuarios/sign_up' (acho que pode tirar essa linha)

end

Then("sou redirecionada para a pagina de login de usuario") do  
   # Nao esta logado, se nao estiver logado, mostra a pagina de login
   visit '/usuarios/sign_up'
end

#Ambiguo com frase acima
#Then("recebo mensagem de erro na pagina de cadastro de medico") do
#  pending # Write code here that turns the phrase above into concrete actions
#end

Then("sou redirecionada para a pagina de login de usuario") do
  pending # Write code here that turns the phrase above into concrete actions
end

