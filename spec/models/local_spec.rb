require 'rails_helper'

RSpec.describe Local, type: :model do
    let(:valid_attributes){
      {
        nome:  "Hospital X",
        cep: Faker::Address.zip_code,
        rua: Faker::Address.street_name,
        numero: Faker::Address.building_number,
        estado: Faker::Address.state_abbr,
        cidade: Faker::Address.city ,
        bairro: Faker::Address.community,
        telefone: Faker::PhoneNumber.phone_number
      }
    }
    let(:invalid_attributes){
      {
        nome:  nil,
        cep: nil,
        rua: nil,
        numero: nil,
        estado: nil,
        cidade: nil,
        bairro: nil,
        telefone: nil
      }
    }

    context "Criar novo local" do
      it "Valido quando nome, cep e número são preenchidos" do
        local = Local.new (valid_attributes)
        expect(local).to be_valid
      end
      it "Invalido quando não existe nome, cep e número são preenchidos" do
        local = Local.new (invalid_attributes)
        expect(local).to_not be_valid
      end
    end

end
