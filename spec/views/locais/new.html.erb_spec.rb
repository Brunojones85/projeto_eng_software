require 'rails_helper'

RSpec.describe "locais/new", type: :view do
  before(:each) do
    assign(:local, Local.new(
      :nome => "MyString",
      :cep => "MyString",
      :rua => "MyString",
      :numero => "MyString",
      :estado => "MyString",
      :cidade => "MyString",
      :bairro => "MyString",
      :telefone => "MyString"
    ))
  end

  it "renders new local form" do
    render

    assert_select "form[action=?][method=?]", locais_path, "post" do

      assert_select "input[name=?]", "local[nome]"

      assert_select "input[name=?]", "local[cep]"

      assert_select "input[name=?]", "local[rua]"

      assert_select "input[name=?]", "local[numero]"

      assert_select "input[name=?]", "local[estado]"

      assert_select "input[name=?]", "local[cidade]"

      assert_select "input[name=?]", "local[bairro]"

      assert_select "input[name=?]", "local[telefone]"
    end
  end
end
