require 'rails_helper'

RSpec.describe "usuarios/edit", type: :view do
  before(:each) do
    @usuario = assign(:usuario, Usuario.create!(
      :nome => "MyString",
      :numerosus => "MyString",
      :senha => "MyString",
      :cpf => "MyString",
      :email => "MyString",
      :telfixo => "MyString",
      :telcel => "MyString",
      :sexo => "MyString"
    ))
  end

  it "renders the edit usuario form" do
    render

    assert_select "form[action=?][method=?]", usuario_path(@usuario), "post" do

      assert_select "input[name=?]", "usuario[nome]"

      assert_select "input[name=?]", "usuario[numerosus]"

      assert_select "input[name=?]", "usuario[senha]"

      assert_select "input[name=?]", "usuario[cpf]"

      assert_select "input[name=?]", "usuario[email]"

      assert_select "input[name=?]", "usuario[telfixo]"

      assert_select "input[name=?]", "usuario[telcel]"

      assert_select "input[name=?]", "usuario[sexo]"
    end
  end
end
