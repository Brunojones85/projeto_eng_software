require 'rails_helper'

RSpec.describe "agendamentos/show", type: :view do
  before(:each) do
    @agendamento = assign(:agendamento, Agendamento.create!(
      :data =>"2018-11-04 19:23:42",
      :local  =>  FactoryBot.create(:local),
      :especialidade => FactoryBot.create(:especialidade),
      :medico =>  FactoryBot.create(:medico),
      :usuario => FactoryBot.create(:usuario)
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(@agendamento.data)
    expect(rendered).to match(@agendamento.local.nome)
    expect(rendered).to match(@agendamento.especialidade.Nome)
    expect(rendered).to match(@agendamento.medico.nome)
    expect(rendered).to match(@agendamento.usuario.nome)
  end
end
