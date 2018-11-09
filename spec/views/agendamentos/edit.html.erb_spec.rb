require 'rails_helper'

RSpec.describe "agendamentos/edit", type: :view do
  before(:each) do
    @agendamento = assign(:agendamento, Agendamento.create!(
      :data =>"2018-11-04 19:23:42",
      :local  =>  FactoryBot.create(:local),
      :especialidade => FactoryBot.create(:especialidade),
      :medico =>  FactoryBot.create(:medico),
      :usuario => FactoryBot.create(:usuario)
    ))
  end

  it "renders the edit agendamento form" do
    render

    assert_select "form[action=?][method=?]", agendamento_path(@agendamento), "post" do
      
      assert_select "select[name=?]", "agendamento[local_id]"
      assert_select "select[name=?]", "agendamento[especialidade_id]"
      assert_select "select[name=?]", "agendamento[medico_id]"
      assert_select "select[name=?]", "agendamento[usuario_id]"
    end
  end
end
