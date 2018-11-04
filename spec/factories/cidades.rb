FactoryBot.define do
  factory :cidade do
    nome { "MyString" }
    estado {  FactoryBot.create(:estado) }
  end
end
