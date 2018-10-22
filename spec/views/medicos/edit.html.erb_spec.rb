require 'rails_helper'


RSpec.describe "medicos/edit", type: :view do
  before(:each) do
    @medico = assign(:medico, Medico.create!(
      :nome => "MyString",
      :crm => "MyString",
      :local => "MyString",
      :telefone => "MyString",
      :celular => "MyString",
      :email => "email2@email",
      :sexo => "MyString",
      :situacao => "MyString"
    ))
  end

  it "renders the edit medico form" do
    render

    assert_select "form[action=?][method=?]", medico_path(@medico), "post" do

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
