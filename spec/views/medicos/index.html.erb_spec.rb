require 'rails_helper'

RSpec.describe "medicos/index", type: :view do
  before(:each) do
    assign(:medicos, [
      Medico.create!(
        :nome => "Nome",
        :crm => "Crm",
        :local => "Local",
        :telefone => "Telefone",
        :celular => "Celular",
        :email => "Email",
        :sexo => "Sexo",
        :situacao => "Situacao"
      ),
      Medico.create!(
        :nome => "Nome",
        :crm => "Crm",
        :local => "Local",
        :telefone => "Telefone",
        :celular => "Celular",
        :email => "Email",
        :sexo => "Sexo",
        :situacao => "Situacao"
      )
    ])
  end

  it "renders a list of medicos" do
    render
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    assert_select "tr>td", :text => "Crm".to_s, :count => 2
    assert_select "tr>td", :text => "Local".to_s, :count => 2
    assert_select "tr>td", :text => "Telefone".to_s, :count => 2
    assert_select "tr>td", :text => "Celular".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Sexo".to_s, :count => 2
    assert_select "tr>td", :text => "Situacao".to_s, :count => 2
  end
end
