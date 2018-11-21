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

When("Eu acesso pagina de criar um novo medico sem estar logado") do
   visit '/medicos/new'
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
  #cria_convidado
  #cria_convidado
  #visit '/'
  #visit '/usuarios/sign_out"'
  #find(:xpath,"/html/body/div[2]/div/div[1]/a[4]").click;        
  visit '/medicos/new'
  expect(page).to have_content("pido - ACESSAR");
  expect(page).to have_content("Esqueceu sua senha?");
  expect(page).to have_content("Criar sua conta");
end


# Cenario: Editar Medico com especialidade repetida

When("Eu cadastro uma especialidade") do
  cria_administrador
  fazer_login_Adm
  visit '/especialidades/new'
  cria_especialidade_valida
  preencherCamposEspecialidade(@especialidadevalida)
  #Qdo configura o bootstrap na pagina o xpath muda
  find(:xpath, "/html/body/form/div[4]/input").click
  expect(page).to have_content("Especialidade was successfully created.")
end

When("Eu cadastro um medico com esta especialidade") do
  #os passos que criam a especialidade estao repedidos aqui
  #porque o cucumber permite controlar o estado da aplicacao "entre paginas"
  #apenas dentro de um passo e nao entre passos.
  #apesar do problema do DRY essa operacao esta testada no passo anterior

  #cadastra a especialidade
  #cria_administrador
  #fazer_login_Adm
  #visit '/especialidades/new'
  #cria_especialidade_valida
  #preencherCamposEspecialidade(@especialidadevalida)
  #Qdo configura o bootstrap na pagina o xpath muda
  #find(:xpath, "/html/body/form/div[4]/input").click

  #incrivelmente funcionou entre passos... deixei os comentarios aqui pra
  #levantar essa questao...
  #cadastra um medico, agora com a especialidade cadastrada anteriormente
  visit '/medicos/new'
  expect(page).to have_content("Cadastrar Novo Medico");
  cria_medico_valido
  preencherCamposMedicoESelecionaUmaEspecialidade(@medicovalido)

  #page.should have_css('#esp_ortopedista[value='1']')  
  find(:css, "#esp_EspecialidadeBemIncomumPraTeste").set(true)  
  find(:xpath, "/html/body/div/div/form/div[9]/input").click
  expect(page).to have_content("Medico was successfully created.")
  expect(page).to have_content("Voltar")
  page.should have_css("a[href='/medicos']")
  expect(page).to have_content("EspecialidadeBemIncomumPraTeste") #Significa que o medico tem essa especialidade
  find(:css, "a[href='/medicos']").click
end

When("Eu clico em voltar para ir ate a pagina que lista medicos") do
  visit '/medicos'
  expect(page).to have_content("EspecialidadeBemIncomumPraTeste") #Significa que o medico tem essa especialidade
  expect(page).to have_content("Medico X2"); # que he o nome do medico que eu cadastrei nos passos anteriore
end

When("Eu clico em editar o medico que eu inseri") do
  expect(page).to have_content("Medico X2") # o ultimo medico valido inserido tem esse nome
  expect(page).to have_content("EspecialidadeBemIncomumPraTeste") #A o medico tinha sido editado pra ter essa especialidade
  #Aqui a gente clica no editar do metido que inserimos
  find(:xpath, "/html/body/div/div/table/tbody/tr[4]/td[11]/a").click #fix-me: Deveria haver so um medico listado, tem 4
end

When("Eu seleciono a mesma especialidade existente que o medico ja tem") do
  #Na pagina de edicao do medico a gente seleciona a mesma especialidade que o medico ha tem pra adicionar ela de novo
  find(:xpath,"//*[@id='esp_EspecialidadeBemIncomumPraTeste']").click
end

When("Eu clico em atualizar medico") do
  #E clicamos em atualizar 
  find(:xpath,"/html/body/div/div/form/div[9]/input").click  
end

Then("Recebo a msg medico atualizado com sucesso mas sem especialidades repetidas") do
  expect(page).to have_no_content("EspecialidadeBemIncomumPraTeste EspecialidadeBemIncomumPraTeste")
  expect(page).to have_content("Medico was successfully updated.")
end
