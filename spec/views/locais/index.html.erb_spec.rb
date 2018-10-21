require 'rails_helper'

RSpec.describe "locais/index", type: :view do
  before(:each) do
    assign(:locais, [
      Local.create!(
        :nome => "Hospital 1",
        :cep => "Cep",
        :rua => "Rua",
        :numero => "Numero",
        :cidade => Cidade.find(1),
        :bairro => "Bairro",
        :telefone => "Telefone",
        :ativo => true
      ),
      Local.create!(
        :nome => "Hospital 2",
        :cep => "Cep",
        :rua => "Rua",
        :numero => "Numero",
        :cidade => Cidade.find(2),
        :bairro => "Bairro",
        :telefone => "Telefone",
        :ativo => true
      )
    ])
  end

  it "renders a list of locais" do
    render
    assert_select "tr>td", :text => "Hospital 1".to_s, :count => 1
    assert_select "tr>td", :text => "Hospital 2".to_s, :count => 1
    assert_select "tr>td", :text => "Cep".to_s, :count => 2
    assert_select "tr>td", :text => "Rua".to_s, :count => 2
    assert_select "tr>td", :text => "Numero".to_s, :count => 2
    assert_select "tr>td", :text => Cidade.find(1).nome.to_s, :count => 1
    assert_select "tr>td", :text => Cidade.find(2).nome.to_s, :count => 1
    assert_select "tr>td", :text => "Bairro".to_s, :count => 2
    assert_select "tr>td", :text => "Telefone".to_s, :count => 2
  end
end
