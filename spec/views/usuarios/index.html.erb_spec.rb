require 'rails_helper'

RSpec.describe "usuarios/index", type: :view do
  before(:each) do
    assign(:usuarios, [
      Usuario.create!(
        :nome => "Nome",
        :numerosus => "Numerosus",
	:email => "email@mail.com",
	:password => "password",
        :cpf => "Cpf",
        :telfixo => "Telfixo",
        :telcel => "Telcel",
        :sexo => "Sexo"
      ),
      Usuario.create!(
        :nome => "Nome",
        :numerosus => "Numerosus",
        :password => "password",
	:email => "email2@mail.com",
        :cpf => "Cpf",
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
    assert_select "tr>td", :text => "Cpf".to_s, :count => 2
    assert_select "tr>td", :text => "email@mail.com".to_s, :count =>1 
    assert_select "tr>td", :text => "email2@mail.com".to_s, :count =>1
    assert_select "tr>td", :text => "password".to_s, :count => 2
    assert_select "tr>td", :text => "Telfixo".to_s, :count => 2
    assert_select "tr>td", :text => "Telcel".to_s, :count => 2
    assert_select "tr>td", :text => "Sexo".to_s, :count => 2
  end
end
