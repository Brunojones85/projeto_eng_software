require 'rails_helper'

RSpec.describe "especialidades/edit", type: :view do
  before(:each) do
    @especialidade = assign(:especialidade, Especialidade.create!(
      :Nome => "MyString",
      :Descricao => "MyString",
      :ativo => true
    ))
  end

  it "renders the edit especialidade form" do
    render

    assert_select "form[action=?][method=?]", especialidade_path(@especialidade), "post" do

      assert_select "input[name=?]", "especialidade[Nome]"

      assert_select "input[name=?]", "especialidade[Descricao]"
    end
  end
end
