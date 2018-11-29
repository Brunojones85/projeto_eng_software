require_relative "steps_helper"
require 'pry'


Dado("que cliquei no botão de buscar sem adicionar nenhum filtro") do
  visit "/agendar"
  find(:css, '#agendamento_search').click()

end
Então("eu vou ver uma mensagem indicando a obrigatoriedade dos filtros") do
  expect(page).to have_content "É necessário escolher o estado, cidade e especialidade médica para filtrar !"
end

Dado("que existam dados de agendamento cadastrados") do

  configura_capybara
  cria_usuario_agendamento
  fazer_login
  cria_registro_agendamento_valido
end

E("eu escolho determinado estado, cidade e especialidade") do
  visit "/agendar"
  find('#estados_id > option:nth-child(2)').click
  find('#q_local_cidade_id_eq').find(:xpath, 'option[2]').select_option
  find('#q_especialidade_id_eq').find(:xpath, 'option[2]').select_option
#  find(:css, '#agendamento_search').click()W
  find(:xpath, '//*[@id="agendamento_search"]/table/tbody/tr[3]/td/input').click

#//*[@id="agendamento_search"]/table/tbody/tr[3]/td/input

end

Então("eu vou ver a lista com os agendamentos correspondentes para aquela cidade, estado e especialidade") do
  expect(page).to have_content @agendamento_valido.local.nome
end
