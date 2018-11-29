require 'rails_helper'

RSpec.describe "locais/edit", type: :view do
  before(:each) do
    @local = assign(:local, Local.create!(
      :nome => "MyString",
      :cep => "MyString",
      :rua => "MyString",
      :numero => "MyString",
      :cidade =>  FactoryBot.create(:cidade),
      :bairro => "MyString",
      :telefone => "MyString",
      :ativo => true
    ))
  end

  it "renders the edit local form" do
    render

    assert_select "form[action=?][method=?]", local_path(@local), "post" do

      assert_select "input[name=?]", "local[nome]"

      assert_select "input[name=?]", "local[cep]"

      assert_select "input[name=?]", "local[rua]"

      assert_select "input[name=?]", "local[numero]"


      assert_select "input[name=?]", "local[bairro]"

      assert_select "input[name=?]", "local[telefone]"
    end
  end
end
