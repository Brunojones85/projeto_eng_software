require_relative "steps_helper"

Dado("que eu não possuo consultas agendadas") do
  cria_usuario_sem_consultas
end

Quando("eu acesso a página de minhas consultas") do
  visit "/usuarios/#{@usuario.id}/agendamentos"
end

Então("eu vou ver uma mensagem indicando que não tenho consultas agendadas") do
  expect(page).to have_content "Não existem dados de agendamentos cadastrados!"
end

Dado("que eu possuo consultas agendadas") do
  cria_usuario_com_consultas
end

Então("eu vou ver as informações sobre minhas consultas agendadas, com a Data, local, horário, especialidade médica e o nome do profissional.") do
  expect(page).to have_content @agendamento_valido.local.nome
  expect(page).to have_content @agendamento_valido.data
  expect(page).to have_content @agendamento_valido.especialidade.Nome
  expect(page).to have_content @agendamento_valido.medico.nome
end
