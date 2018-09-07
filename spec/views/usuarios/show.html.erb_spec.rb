require 'rails_helper'

RSpec.describe "usuarios/show", type: :view do
  before(:each) do
    @usuario = assign(:usuario, Usuario.create!(
      :nome => "Nome",
      :numerosus => "Numerosus",
      :senha => "Senha",
      :cpf => "Cpf",
      :email => "Email",
      :telfixo => "Telfixo",
      :telcel => "Telcel",
      :sexo => "Sexo"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(/Numerosus/)
    expect(rendered).to match(/Senha/)
    expect(rendered).to match(/Cpf/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Telfixo/)
    expect(rendered).to match(/Telcel/)
    expect(rendered).to match(/Sexo/)
  end
end
