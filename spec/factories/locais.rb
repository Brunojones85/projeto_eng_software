FactoryBot.define do
  factory :local do
    nome { "HOSPITAL #{Faker::Name.name}" }
    cep { "MyString" }
    rua { "MyString" }
    numero { "MyString" }
    cidade { FactoryBot.create(:cidade) }
    ativo { true }
    bairro { "MyString" }
    telefone { "MyString" }
  end
end
