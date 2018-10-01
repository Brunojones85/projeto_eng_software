#from: https://github.com/RailsApps/rails3-devise-rspec-cucumber/blob/master/features/step_definitions/user_steps.rb
#apesar de definida a fabrica em spec/factories/usuarios.rb
#essa func ainda e necessaria.. a fabrica tb...
#nao sei exatamenta ainda o porque as duas coisas sao necessarias
#pra pra fazer passar
#Given("I exist as a user") do
#  cria_usuario
#end
require_relative "steps_helper"


def fazer_login
  visit '/usuarios/sign_in'  
  fill_in "usuario_email", :with => @convidado[:email]
  fill_in "usuario_password", :with => @convidado[:password]
  find(:xpath, "/html/body/div/div/form/button").click
end

Given("Eu sou um usuario existente") do
  cria_usuario
end

Given("Eu nao estou logado") do
  #visit '/usuarios/sign_out'
end

When("Eu logo com credenciais validas") do
  cria_convidado
  fazer_login
end

Then("Eu vejo uma msg login realizado com sucesso") do
  expect(page).to have_content("sucesso")
end

When("Eu entro na pagina inicial") do
   visit '/'
end

Then("Eu devo estar logado") do
  expect(page).to have_content("Sair")
end
