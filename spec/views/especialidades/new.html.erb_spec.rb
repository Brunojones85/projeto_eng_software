require 'rails_helper'

RSpec.describe "especialidades/new", type: :view do
  before(:each) do
    assign(:especialidade, Especialidade.new(
      :Nome => "MyString",
      :Descricao => "MyString"
    ))
  end

  it "renders new especialidade form" do
    render

    assert_select "form[action=?][method=?]", especialidades_path, "post" do

      assert_select "input[name=?]", "especialidade[Nome]"

      assert_select "input[name=?]", "especialidade[Descricao]"
    end
  end
end
