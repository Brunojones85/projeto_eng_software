require 'rails_helper'

RSpec.describe "usuarios/show", type: :view do
  before(:each) do
    @usuario = assign(:usuario, Usuario.create!(
      :nome => "Nome",
      :numerosus => "Numerosus",
      :cpf => "Cpf",
      :email => "email@mail.com",
      :password =>"password",
      :telfixo => "Telfixo",
      :telcel => "Telcel",
      :sexo => "Sexo"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(/Numerosus/)
    expect(rendered).to match(/Cpf/)
    expect(rendered).to match(/email/)
    expect(rendered).to match(/password/)   
    expect(rendered).to match(/Telfixo/)
    expect(rendered).to match(/Telcel/)
    expect(rendered).to match(/Sexo/)
  end
end
