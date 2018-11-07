require 'rails_helper'

RSpec.describe "especialidades/show", type: :view do
  before(:each) do
    @especialidade = assign(:especialidade, Especialidade.create!(
      :Nome => "Nome",
      :Descricao => "Descricao" , 
      :ativo => true
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(/Descricao/)
  end
end
