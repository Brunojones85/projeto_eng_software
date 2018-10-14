require_relative "steps_helper"

Dado("que eu estou logado") do
  cria_convidado
  fazer_login
end

Quando("acesso a página de cadastro de local de consulta") do
  visit "/locais/new"
end

Quando("faço a submissão do formulário com dados válidos") do
  cria_local_valido
  preencherCamposLocal(@localvalido)
  find('#estado_id').find(:xpath, 'option[1]').select_option
  find('#local_cidade_id').find(:xpath, 'option[1]').select_option
  find(:xpath, "/html/body/form/div[10]/input").click
end

Então("eu vou conseguir ver o novo local na página de listagem de locais de consultas") do
  visit "/locais/"
  page.find('td', text: @localvalido[:nome])
end

Quando("faço a submissão do formulário com dados inválidos") do
  cria_local_invalido
  preencherCamposLocal(@localinvalido)
  find(:xpath, "/html/body/form/div[10]/input").click
end

Então("eu vou visualizar uma mensagem de erro") do
  page.find('h2',  text: 'error')
end
