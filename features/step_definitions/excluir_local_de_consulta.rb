require_relative "steps_helper"

E("existem locais cadastrados") do
  visit "/locais/new"
  cria_local_valido
  preencherCamposLocal(@localvalido)
  find(:xpath, "/html/body/form/div[10]/input").click
end

Quando("acesso a página de listagem de locais de consulta") do
  visit "/locais/"
end

Quando("escolho excluir para um determinado registro") do
  find(:xpath, "/html/body/table/tbody/tr/td[12]/a").click
end

Então("eu não vou conseguir mais ver esse registro na página de listagem de locais de consulta") do
  page.should have_no_selector(:xpath, "/html/body/table/tbody/tr/td[1]")
end
