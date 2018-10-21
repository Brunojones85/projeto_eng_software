require_relative "steps_helper"


Quando("acesso a página de listagem de locais de consulta") do
  visit "/locais/"
end

Quando("escolho excluir para um determinado registro") do
  #used for debugging!!!
  #binding.pry
  td = page.find(:css, 'td.nome', text: @localvalido[:nome])
  tr = td.find(:xpath, './parent::tr') # get the parent tr of the td
  tr.find(:css, 'td.Destroy').click
  page.driver.browser.switch_to.alert.accept
end

Então("eu não vou conseguir mais ver esse registro na página de listagem de locais de consulta") do
  page.should have_no_selector(:css, 'td.nome', text: @localvalido[:nome])
end
