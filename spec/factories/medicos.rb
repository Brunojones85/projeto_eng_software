FactoryBot.define do
  factory :medico do
    nome { Faker::Name.name_with_middle }
    crm { "MyString" }
    local { "MyString" }
    telefone { "MyString" }
    celular { "MyString" }
    email {Faker::Internet.email }
    sexo { "MyString" }
    situacao { "MyString" }
  end
end
