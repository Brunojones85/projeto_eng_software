FactoryBot.define do
  factory :estado do
    sigla { Faker::Address.state_abbr }
    nome { Faker::Address.state  }
  end
end
