require_relative "steps_helper"

def cria_local_valido
  @localvalido = {
    :nome => "Hospital X",
    :cep => Faker::Address.zip_code,
    :rua => Faker::Address.street_name,
    :numero => Faker::Address.building_number,
    :estado => Faker::Address.state_abbr,
    :cidade => Faker::Address.city ,
    :bairro => Faker::Address.community,
    :telefone => Faker::PhoneNumber.phone_number
  }
end

def cria_local_invalido
  @localinvalido = {
    :nome => nil,
    :cep => nil,
    :rua => nil,
    :numero => nil,
    :estado => nil,
    :cidade => nil,
    :bairro => nil,
    :telefone => nil
  }
end

Dado("que eu estou logado") do
  cria_convidado
  fazer_login
end

Quando("acesso a página de cadastro de local de consulta") do
  visit "/locais/new"
end

Quando("faço a submissão do formulário com dados válidos") do
  cria_local_valido
  fill_in "local_nome", :with => @localvalido[:nome]
  fill_in "local_cep", :with => @localvalido[:cep]
  fill_in "local_rua", :with => @localvalido[:rua]
  fill_in "local_estado", :with => @localvalido[:estado]
  fill_in "local_cidade", :with => @localvalido[:cidade]
  fill_in "local_bairro", :with => @localvalido[:bairro]
  fill_in "local_numero", :with => @localvalido[:numero]
  fill_in "local_telefone", :with => @localvalido[:telefone]
  find(:xpath, "/html/body/form/div[9]/input").click
end

Então("eu vou conseguir ver o novo local na página de listagem de locais de consultas") do
  visit "/locais/"
  page.find('td', text: @localvalido[:nome])
end

Quando("faço a submissão do formulário com dados inválidos") do
  cria_local_invalido
  fill_in "local_nome", :with => @localinvalido[:nome]
  fill_in "local_cep", :with => @localinvalido[:cep]
  fill_in "local_rua", :with => @localinvalido[:rua]
  fill_in "local_estado", :with => @localinvalido[:estado]
  fill_in "local_cidade", :with => @localinvalido[:cidade]
  fill_in "local_bairro", :with => @localinvalido[:bairro]
  fill_in "local_numero", :with => @localinvalido[:numero]
  fill_in "local_telefone", :with => @localinvalido[:telefone]
  find(:xpath, "/html/body/form/div[9]/input").click
end

Então("eu vou visualizar uma mensagem de erro") do
  page.find('h2',  text: 'error')
end
