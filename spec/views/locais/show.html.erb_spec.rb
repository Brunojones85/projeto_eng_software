require 'rails_helper'

RSpec.describe "locais/show", type: :view do
  before(:each) do
    @local = assign(:local, Local.create!(
      :nome => "Nome",
      :cep => "Cep",
      :rua => "Rua",
      :numero => "Numero",
      :cidade =>  FactoryBot.create(:cidade),
      :bairro => "Bairro",
      :telefone => "Telefone",
      :ativo => true
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(/Cep/)
    expect(rendered).to match(/Rua/)
    expect(rendered).to match(/Numero/)
    expect(rendered).to match(/Bairro/)
    expect(rendered).to match(/Telefone/)
  end
end
