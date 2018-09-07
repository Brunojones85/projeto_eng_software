require 'rails_helper'

RSpec.describe "usuarios/index", type: :view do
  before(:each) do
    assign(:usuarios, [
      Usuario.create!(
        :nome => "Nome",
        :numerosus => "Numerosus",
        :senha => "Senha",
        :cpf => "Cpf",
        :email => "Email",
        :telfixo => "Telfixo",
        :telcel => "Telcel",
        :sexo => "Sexo"
      ),
      Usuario.create!(
        :nome => "Nome",
        :numerosus => "Numerosus",
        :senha => "Senha",
        :cpf => "Cpf",
        :email => "Email",
        :telfixo => "Telfixo",
        :telcel => "Telcel",
        :sexo => "Sexo"
      )
    ])
  end

  it "renders a list of usuarios" do
    render
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    assert_select "tr>td", :text => "Numerosus".to_s, :count => 2
    assert_select "tr>td", :text => "Senha".to_s, :count => 2
    assert_select "tr>td", :text => "Cpf".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Telfixo".to_s, :count => 2
    assert_select "tr>td", :text => "Telcel".to_s, :count => 2
    assert_select "tr>td", :text => "Sexo".to_s, :count => 2
  end
end
