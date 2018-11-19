require_relative "steps_helper"
require 'pry'


Quando("eu faço uma busca de agendamento de consultas") do
  cria_usuario_sem_consultas
  cria_registro_agendamento_valido
  configura_capybara
  visit "/agendar"
  find('#estado_id > option:nth-child(2)').click
  binding.pry
  find('#q_local_cidade_id_eq').find(:xpath, 'option[2]').select_option
  find('#q_especialidade_id_eq').find(:xpath, 'option[2]').select_option
  find(:xpath, '//*[@id="agendamento_search"]/table/tbody/tr[3]/td/input').click

end

Quando("seleciono marcar consulta para algum dos resultados") do
  pending # Write code here that turns the phrase above into concrete actions

end

Então("eu vou conseguir ver esse registro na página meus agendamentos") do

end
