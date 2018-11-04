FactoryBot.define do
  factory :especialidade do
    Nome { Faker::Company.profession }
    Descricao { Faker::GreekPhilosophers.quote }
  end
end
