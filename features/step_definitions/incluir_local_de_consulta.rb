require_relative "steps_helper"

Dado("que eu estou logado") do
  cria_convidado
  fazer_login
end

Quando("acesso a página de cadastro de local de consulta") do
  visit "/locais/new/"
end

Quando("faço a submissão do formulário com dados válidos") do
  configura_capybara
  cria_local_valido

end

Então("eu vou conseguir ver o novo local na página de listagem de locais de consultas") do
  visit "/locais/"
  page.find('td', text: @localvalido[:nome])

  Capybara.configure do |config|
    config.default_max_wait_time = 10 # seconds
    config.default_driver        = :rack_test
  end
end

Quando("faço a submissão do formulário com dados inválidos") do
  cria_local_invalido
  preencherCamposLocal(@localinvalido)
  find(:xpath, "/html/body/form/div[10]/input").click
end

Então("eu vou visualizar uma mensagem de erro") do
  page.find('h2',  text: 'error')
end
