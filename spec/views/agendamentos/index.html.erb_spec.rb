require 'rails_helper'


RSpec.describe "agendamentos/index", type: :view do
  before(:each) do
    @agendamentos = assign(:agendamentos, [
      Agendamento.create!(
        :data =>"2018-11-04 19:23:42",
        :local  =>  FactoryBot.create(:local),
        :especialidade => FactoryBot.create(:especialidade),
        :medico =>  FactoryBot.create(:medico),
        :usuario => FactoryBot.create(:usuario)
      ),
      Agendamento.create!(
        :data =>"2018-11-05 19:23:42",
        :local  =>  FactoryBot.create(:local),
        :especialidade => FactoryBot.create(:especialidade),
        :medico =>  FactoryBot.create(:medico),
        :usuario => FactoryBot.create(:usuario)
      )
    ])
  end

  it "renders a list of agendamentos" do
    render
    assert_select "p", :text => "DATA: #{@agendamentos[0].data.to_s}", :count => 1
    assert_select "p", :text => "DATA: #{@agendamentos[1].data.to_s}", :count => 1
    assert_select "p", :text =>"Local: #{@agendamentos[0].local.nome.to_s} - #{@agendamentos[0].local.cidade.nome.to_s} - #{@agendamentos[0].local.cidade.estado.nome.to_s}" , :count => 1
    assert_select "p", :text =>"Local: #{@agendamentos[1].local.nome.to_s} - #{@agendamentos[1].local.cidade.nome.to_s} - #{@agendamentos[1].local.cidade.estado.nome.to_s}" , :count => 1
    assert_select "p", :text =>"Medico: #{@agendamentos[0].medico.nome.to_s}" , :count => 1
    assert_select "p", :text =>"Medico: #{@agendamentos[1].medico.nome.to_s}" , :count => 1
    assert_select "p", :text =>"Especialidade: #{@agendamentos[0].especialidade.Nome.to_s}", :count => 1
    assert_select "p", :text =>"Especialidade: #{@agendamentos[1].especialidade.Nome.to_s}", :count => 1
    assert_select "p", :text => @agendamentos[0].usuario.nome.to_s, :count => 1
    assert_select "p", :text => @agendamentos[1].usuario.nome.to_s, :count => 1
  end
end
