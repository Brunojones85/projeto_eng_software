require_relative "steps_helper"
require 'selenium-webdriver'

def cria_especialidade_valida
  @especialidadevalida = {
    :Nome => "Clinico geral",
    :Descricao => "Atendimento geral",
    :ativo => true
  }
end 

def preencherCamposLocal(objeto)
  fill_in "especialidade_Nome", :with => objeto[:Nome]
  fill_in "especialidade_Descricao", :with => objeto[:Descricao]
  fill_in "especialidade_ativo", :with =>objeto[:ativo]

end

Dado("que eu criei uma especialiade") do
  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, browser: :chrome)
  end
  Capybara.javascript_driver = :chrome
  Capybara.configure do |config|
    config.default_max_wait_time = 10 # seconds
    config.default_driver        = :selenium
  end

  visit "/especialidades/new"
  cria_especialidade_valida
  preencherCamposLocal(@especialidadevalida)
  
  find(:css, '#especialidade_ativo').click
  find(:xpath, "/html/body/form/div[10]/input").click
end


Quando("acesso a página para editar especialidade") do
    visit "/especialidades/"
    td = page.find(:css, 'td.nome', text: @localvalido[:nome]) # find the id td with text of exactly 22
    tr = td.find(:xpath, './parent::tr') # get the parent tr of the td
    tr.find(:css, 'td.Edit').click
end

Quando("altero o status do registro da especialidade") do
    find(:css, '#local_ativo').click
    sleep 10
    find(:xpath, "/html/body/form/div[10]/input").click
end

Então("eu vou conseguir ver esse esta especialidade  com o status desativado") do
  visit "/locais"
  td = page.find(:css, 'td.nome', text: @localvalido[:nome]) # find the id td with text of exactly 22
  tr = td.find(:xpath, './parent::tr') # get the parent tr of the td
  expect(tr).to have_css('td.ativo', text: 'false')


  Capybara.configure do |config|
    config.default_max_wait_time = 10 # seconds
    config.default_driver        = :rack_test
  end
end
