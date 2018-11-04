require_relative "steps_helper"
require_relative "incluir_especialiade_steps"


Quando("acesso a página de listagem de especialidades") do
  visit "/especialidades/"
end

Quando("escolho excluir a primeira especialidade da lista") do
  #used for debugging!!!
  #binding.pry
  td = page.find(:css, 'td.nome', text: @localvalido[:nome])
  tr = td.find(:xpath, './parent::tr') # get the parent tr of the td
  tr.find(:css, 'td.Destroy').click
  page.driver.browser.switch_to.alert.accept
end

Então("eu não consigo mais consultar a especialidade") do
  page.should have_no_selector(:css, 'td.nome', text: @localvalido[:nome])
end
