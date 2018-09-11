FactoryBot.define do
  factory :usuario do
    nome {"admin"}
    email {"admin@admin"}
    numerosus {"1234567"}
    cpf {"0987"}
    password {"123456"}
    password_confirmation {"123456"}
  end
end
