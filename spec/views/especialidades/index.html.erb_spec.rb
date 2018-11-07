require 'rails_helper'

RSpec.describe "especialidades/index", type: :view do
  before(:each) do
    assign(:especialidades, [
      Especialidade.create!(
        :Nome => "Nome",
        :Descricao => "Descricao", 
        :ativo => true
      ),
      Especialidade.create!(
        :Nome => "Nome",
        :Descricao => "Descricao" , 
        :ativo =>true 
      )
    ])
  end

  it "renders a list of especialidades" do
    render
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
  end
end
