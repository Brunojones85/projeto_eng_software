require_relative "steps_helper"
require 'selenium-webdriver'
require 'pry'
Dado("que eu criei um local de consulta") do
  configura_capybara
  cria_local_valido
  visit "/locais/new"
  preencherCamposLocal(@localvalido)
#  binding.pry
  find('#estado_id > option:nth-child(2)').click
  find('#local_cidade_id').find(:xpath, 'option[2]').select_option
  find(:css, '#local_ativo').click
  find(:xpath, "/html/body/form/div[10]/input").click
end

Quando("acesso a página para editar o local de consulta cadastrado") do
    visit "/locais/"
    td = page.find(:css, 'td.nome', text: @localvalido[:nome]) # find the id td with text of exactly 22
    tr = td.find(:xpath, './parent::tr') # get the parent tr of the td
    tr.find(:css, 'td.Edit').click
end

Quando("altero o status do registro para desativado") do
    find(:css, '#local_ativo').click
    sleep 10
    find(:xpath, "/html/body/form/div[10]/input").click
end

Então("eu vou conseguir ver esse registro com o status desativado na página de listagem de locais de consulta") do
  visit "/locais"
  td = page.find(:css, 'td.nome', text: @localvalido[:nome]) # find the id td with text of exactly 22
  tr = td.find(:xpath, './parent::tr') # get the parent tr of the td
  expect(tr).to have_css('td.ativo', text: 'false')


  Capybara.configure do |config|
    config.default_max_wait_time = 10 # seconds
    config.default_driver        = :rack_test
  end

end
