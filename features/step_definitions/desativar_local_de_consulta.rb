require_relative "steps_helper"

Dado("que eu criei um local de consulta") do
  visit "/locais/new"
  cria_local_valido
  preencherCamposLocal(@localvalido)

  find('#estado_id').find(:xpath, 'option[2]').select_option

  find(:css, '#local_ativo').click
  find(:xpath, "/html/body/form/div[10]/input").click
end


Quando("acesso a página para editar o local de consulta cadastrado") do
    visit "/locais/"
    find(:xpath, "/html/body/table/tbody/tr/td[11]/a").click
end

Quando("altero o status do registro para desativado") do
    find(:css, '#local_ativo').click
    find(:xpath, "/html/body/form/div[10]/input").click
end

Então("eu vou conseguir ver esse registro com o status desativado na página de listagem de locais de consulta") do
  visit "/locais"
  page.find('/html/body/table/tbody/tr/td[2]',  text: 'false')

end
