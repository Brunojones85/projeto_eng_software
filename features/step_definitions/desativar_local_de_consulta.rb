require_relative "steps_helper"

def cria_local_valido
  @localvalido = {
    :nome => "Hospital Z",
    :cep => Faker::Address.zip_code,
    :rua => Faker::Address.street_name,
    :estado => Faker::Address.state_abbr,
    :numero => Faker::Address.building_number,
    :cidade => Faker::Address.city ,
    :bairro => Faker::Address.community,
    :telefone => Faker::PhoneNumber.phone_number
  }
  @local = FactoryBot.create(:local, @localvalido)
end


E("existem locais cadastrados") do
  visit "/locais/new"
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

Quando("acesso a página de listagem de locais de consulta") do
  visit "/locais/"
end

Quando("escolho desativar para um determinado registro") do
  find(:xpath, "/html/body/table/tbody/tr/td[11]/a").click
end

Então("eu não vou conseguir mais ver esse registro na página de listagem de locais de consulta") do
  page.should have_no_selector(:xpath, "/html/body/table/tbody/tr/td[1]")

end
