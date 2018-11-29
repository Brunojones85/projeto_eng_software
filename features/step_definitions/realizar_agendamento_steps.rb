require_relative "steps_helper"
require 'pry'

Quando("eu faço uma busca de agendamento de consultas") do
  configura_capybara
  cria_usuario_agendamento
  fazer_login
  cria_usuario_sem_consultas
  cria_registro_agendamento_valido
  visit "/agendar"
  find('#estados_id > option:nth-child(2)').click
  find('#q_local_cidade_id_eq').find(:xpath, 'option[2]').select_option
  find('#q_especialidade_id_eq').find(:xpath, 'option[2]').select_option
  find(:xpath, '//*[@id="agendamento_search"]/table/tbody/tr[3]/td/input').click
end

Quando("seleciono marcar consulta para algum dos resultados") do
  find(:xpath, '//*[@id="agendamento_search"]/div/div/p[6]/a').click
end

Então("eu vou conseguir ver esse registro na página meus agendamentos") do
  visit "usuarios/#{@convidado.id}/agendamentos/"
  expect(page).to have_content @agendamento_valido.local.nome
  expect(page).to have_content @agendamento_valido.medico.nome
  expect(page).to have_content @agendamento_valido.medico.crm
  expect(page).to have_content @agendamento_valido.especialidade.Nome
  expect(page).to have_content @agendamento_valido.data
end
