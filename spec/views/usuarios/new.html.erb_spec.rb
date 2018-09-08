require 'rails_helper'

RSpec.describe "usuarios/new", type: :view do
  before(:each) do
    assign(:usuario, Usuario.new(
      :nome => "MyString",
      :numerosus => "MyString",
      :cpf => "MyString",
      :telfixo => "MyString",
      :telcel => "MyString",
      :sexo => "MyString"
    ))
  end

  it "renders new usuario form" do
    render

    assert_select "form[action=?][method=?]", usuarios_path, "post" do

      assert_select "input[name=?]", "usuario[nome]"

      assert_select "input[name=?]", "usuario[numerosus]"

      assert_select "input[name=?]", "usuario[cpf]"

      assert_select "input[name=?]", "usuario[telfixo]"

      assert_select "input[name=?]", "usuario[telcel]"

      assert_select "input[name=?]", "usuario[sexo]"
    end
  end
end
