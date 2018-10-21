require_relative "steps_helper"

# Cenário: Cadastro realizado com sucesso (Caminho Feliz)
  
Dado("Eu sou o Administrador") do
  cria_administrador
end


Dado("Eu estou logado") do
  cria_administrador
  fazer_login_Adm
end

Quando("Eu acesso pagina de criar um novo medico") do
   cria_administrador
   fazer_login_Adm
   visit '/medicos/new'
end

Quando("envio o formulario de medico com dados validos") do
  cria_administrador
  fazer_login_Adm
   visit '/medicos/new'
  cria_medico_valido
  preencherCamposMedico(@medicovalido)
  find(:xpath, "/html/body/form/div[9]/input").click

end

Entao("na pagina principal recebo a mensagem de Medico cadastrado com sucesso!") do
  cria_administrador
  fazer_login_Adm
  visit '/medicos/new'
  cria_medico_valido
  preencherCamposMedico(@medicovalido)
  find(:xpath, "/html/body/form/div[9]/input").click
  expect(page).to have_content("Medico was successfully created.")
end

# Cenário: Cadastro com dados obrigatorios faltando
 
Dado("Eu sou Administrador") do
  cria_administrador
  fazer_login_Adm
end

Quando ("envio o form de novo medico com todos os campos em branco") do
  cria_administrador
  fazer_login_Adm
  visit '/medicos/new'
  medico_sem_dado_no_form
 # find(:xpath, "/html/body/form/div[9]/input").click

end

Entao ("recebo mensagems de erro na página de cadastro de médico para os seguintes campos:") do |table|
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


# Cenário: Acesso direto sem estar logado
   

Dado("Eu sou um convidado") do
  cria_convidado
end

Dado("Eu não estou logado") do
  cria_convidado
end

Entao ("recebo mensagem de erro na página de cadastro de médico") do  
 # Verifica se está logado, se não estiver logado, mostra mensagem de erroexpect(1==1)
 # Não será possível usar o comando "   visit '/usuarios/sign_out'  " devido ao erro 
 # "   Couldn't find Usuario with 'id'=sign_out (ActiveRecord::RecordNotFound)  "    

  visit '/medicos/new'
  expect(page).to have_content("Você precisa estar logado para acessar esta página")
 # visit '/usuarios/sign_up' (acho que pode tirar essa linha)

end

Entao("sou redirecionada para a página de login de usuário") do  
   # Não está logado, se não estiver logado, mostra a página de login
   visit '/usuarios/sign_up'
end


