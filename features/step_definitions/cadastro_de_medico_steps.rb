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
   visit '/medicos/new'
end

Quando("envio o formulario de medico com dados validos") do
  cria_medico_valido
  preencherCamposMedico(@medicovalido)

 # find(:xpath, "/html/body/form/div[9]/input").click

end

Entao("na pagina principal recebo a mensagem de Medico cadastrado com sucesso!") do
  # expect(page).to have_content("Medico was successfully created")
  # expect(page).to have_content("New Medico")


end

# Cenário: Cadastro com dados obrigatorios faltando
 
Dado("Eu sou Administrador") do
  cria_administrador
  fazer_login_Adm
end

Quando ("envio o form de novo medico com todos os campos em branco") do

pending

end

Entao ("recebo mensagems de erro na página de cadastro de médico para os seguintes campos:") do |table|
pending
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
pending
end

Entao("sou redirecionada para a página de login de usuário") do  
   # Não está logado, se não estiver logado, mostra a página de login
   visit '/usuarios/sign_up'
end


