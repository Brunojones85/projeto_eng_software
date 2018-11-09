FactoryBot.define do
  factory :agendamento do
    data { DateTime.now() }
    local {  FactoryBot.create(:local) }
    especialidade { FactoryBot.create(:especialidade) }
    medico { FactoryBot.create(:medico) }
    usuario { FactoryBot.create(:usuario) }
  end
end
