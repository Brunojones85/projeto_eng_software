require 'rails_helper'

RSpec.describe Local, type: :model do
    let(:valid_attributes){
      {
        nome:  "Hospital X",
        cep: Faker::Address.zip_code,
        rua: Faker::Address.street_name,
        numero: Faker::Address.building_number,
        cidade: FactoryBot.create(:cidade),
        bairro: Faker::Address.community,
        telefone: Faker::PhoneNumber.phone_number,
        ativo: true
      }
    }
    let(:invalid_attributes){
      {
        nome:  nil,
        cep: nil,
        rua: nil,
        numero: nil,

        cidade: nil,
        bairro: nil,
        telefone: nil,
        ativo: nil
      }
    }

    context "Criar novo local" do
      it "Valido quando nome, cep, número e status(ativo/não ativo) são preenchidos" do
        local = Local.new (valid_attributes)
        expect(local).to be_valid
      end
      it "Invalido quando não existe nome, cep, número ou status(ativo/não ativo) " do
        local = Local.new (invalid_attributes)
        expect(local).to_not be_valid
      end
    end

end
