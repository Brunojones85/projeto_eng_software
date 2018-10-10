require 'rails_helper'

RSpec.describe "medicos/new", type: :view do
  before(:each) do
    assign(:medico, Medico.new(
      :nome => "MyString",
      :crm => "MyString",
      :local => "MyString",
      :telefone => "MyString",
      :celular => "MyString",
      :email => "MyString",
      :sexo => "MyString",
      :situacao => "MyString"
    ))
  end

  it "renders new medico form" do
    render

    assert_select "form[action=?][method=?]", medicos_path, "post" do

      assert_select "input[name=?]", "medico[nome]"

      assert_select "input[name=?]", "medico[crm]"

      assert_select "input[name=?]", "medico[local]"

      assert_select "input[name=?]", "medico[telefone]"

      assert_select "input[name=?]", "medico[celular]"

      assert_select "input[name=?]", "medico[email]"

      assert_select "input[name=?]", "medico[sexo]"

      assert_select "input[name=?]", "medico[situacao]"
    end
  end
end
