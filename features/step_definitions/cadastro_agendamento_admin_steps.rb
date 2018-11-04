require_relative "steps_helper"

#Cenário: Cadastrar informações para agendar consultas com sucesso (Cenário Feliz)

Dado("que eu cadastrei informações para agendar consultas para determinado dia e horário") do
  cria_info_agendamento_valido
end

Então("eu vou conseguir ver essas informações na página de cadastro de informações") do
  visit "/agendamentos"
  expect(page).to have_content @agendamento_valido.local.nome
  expect(page).to have_content @agendamento_valido.medico.nome
  expect(page).to have_content @agendamento_valido.usuario.nome
end



#Cenário: Erro ao inserir informações inválidas para agendar consultas (Cenário Triste)

Dado("que eu fiz a submissão de informações inválidas no de cadastro de informações para agendamento consultas") do

  visit "/agendamentos/new"
  find(:xpath, "/html/body/form/div[6]/input").click()
end

Então("eu vou ver uma mensagem de erro na página de cadastro de informações de consulta") do
  expect(page).to have_content "error"
end
