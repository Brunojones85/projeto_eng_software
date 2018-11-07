FactoryBot.define do
  factory :especialidade do
    Nome { Faker::Company.profession }
    Descricao { Faker::GreekPhilosophers.quote }
    ativo {true}
  end
end
