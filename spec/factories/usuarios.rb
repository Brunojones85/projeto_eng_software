FactoryBot.define do
  factory :usuario do
    nome {Faker::Name.name_with_middle}
    email {Faker::Internet.email}
    numerosus {Faker::Number.number(10)}
    cpf {Faker::CPF.numeric}
    password {"123456"}
    password_confirmation {"123456"}
  end
end
