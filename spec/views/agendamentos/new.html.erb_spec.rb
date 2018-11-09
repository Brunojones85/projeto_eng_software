require 'rails_helper'

RSpec.describe "agendamentos/new", type: :view do
  before(:each) do
    assign(:agendamento, Agendamento.new(
      :data =>"2018-11-04 19:23:42",
      :local  =>  FactoryBot.create(:local),
      :especialidade => FactoryBot.create(:especialidade),
      :medico =>  FactoryBot.create(:medico),
      :usuario => FactoryBot.create(:usuario)
    ))
  end

  it "renders new agendamento form" do
    render

    assert_select "form[action=?][method=?]", agendamentos_path, "post" do

      assert_select "select[name=?]", "agendamento[local_id]"

      assert_select "select[name=?]", "agendamento[especialidade_id]"

      assert_select "select[name=?]", "agendamento[medico_id]"

      assert_select "select[name=?]", "agendamento[usuario_id]"
    end
  end
end
