FactoryBot.define do
  factory :cidade do
    nome { Faker::Address.city }
    estado {  FactoryBot.create(:estado) }
  end
end
