require 'rails_helper'


RSpec.describe "medicos/show", type: :view do
  before(:each) do
    @medico = assign(:medico, Medico.create!(
      :nome => "Nome",
      :crm => "Crm",
      :local => "Local",
      :telefone => "Telefone",
      :celular => "Celular",
      :email => "email1@email",
      :sexo => "Sexo",
      :situacao => "Situacao"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(/Crm/)
    expect(rendered).to match(/Local/)
    expect(rendered).to match(/Telefone/)
    expect(rendered).to match(/Celular/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Sexo/)
    expect(rendered).to match(/Situacao/)
  end
end
