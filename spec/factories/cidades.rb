FactoryBot.define do
  factory :cidade do
    nome { "SAO PAULO" }
    estado {  FactoryBot.create(:estado) }
  end
end
