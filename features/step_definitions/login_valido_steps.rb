#from: https://github.com/RailsApps/rails3-devise-rspec-cucumber/blob/master/features/step_definitions/user_steps.rb
#apesar de definida a fabrica em spec/factories/usuarios.rb
#essa func ainda e necessaria.. a fabrica tb...
#nao sei exatamenta ainda o porque as duas coisas sao necessarias
#pra pra fazer passar
#Given("I exist as a user") do
#  cria_usuario
#end

def cria_convidado
  @convidado ||= {
    :nome => "admin", :email => "admin@admin",
    :numerosus => "1234567", :cpf => "0987",
    :password => "123456", :password_confirmation => "123456" }
end

def find_user
  @usuario ||= User.where(:email => @visitor[:email]).first
end

def create_unconfirmed_user
  cria_convidado
  exclui_usuario
  sign_up
  visit '/users/sign_out'
end

def cria_usuario
  cria_convidado
  exclui_usuario
  @usuario = FactoryBot.create(:usuario, @convidado)
end

def exclui_usuario
  @usuario ||= Usuario.where(:email => @convidado[:email]).first
  @usuario.destroy unless @usuario.nil?
end

#Ver ser util para caso de teste de registrar usuario
def sign_up
  exclui_usuario
  visit '/users/sign_up'
  fill_in "user_name", :with => @visitor[:name]
  fill_in "user_email", :with => @visitor[:email]
  fill_in "user_password", :with => @visitor[:password]
  fill_in "user_password_confirmation", :with => @visitor[:password_confirmation]
  click_button "Sign up"
  find_user
end

def fazer_login
  visit '/usuarios/sign_in'
  fill_in "Email", :with => @convidado[:email]
  fill_in "Password", :with => @convidado[:password]
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
