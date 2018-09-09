require 'rails_helper'

RSpec.describe Usuario, type: :model do

  let(:valid_attributes){
    
    {
      nome: "Nome usuario 1",
      numerosus: "123456",
      password: "123456",
      cpf: "123.123.123-12",
      email: "mail1@email.com",
      dtanasc: "2018-09-07",
      telfixo:  "9 1234-1234",
      telcel: "9 1234-1234",
      sexo: "male"
    }   
  } 

    context "Criar novo usuario" do

        it "deve existir somente um usuario por numerosus" do
           usuario = Usuario.create! valid_attributes           
           quantidade = Usuario.where(numerosus: usuario.numerosus).count
	   expect( quantidade).to be_equal(1)
        end

        it "deve existir somente um usuario por CPF" do

           usuario = Usuario.create! valid_attributes
	   quantidade = Usuario.where(cpf: usuario.cpf).count
           expect( quantidade).to be_equal(1)		

        end
        
        it "deve existir somente um usuario por email" do
           usuario = Usuario.create! valid_attributes
           quantidade = Usuario.where(email: usuario.email).count
           expect( quantidade).to be_equal(1)
        end


    end
	
end
