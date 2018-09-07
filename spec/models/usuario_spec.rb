require 'rails_helper'

RSpec.describe Usuario, type: :model do
     before(:each) do
          @user          = Usuario.new
          @user.nome     = "Nome"
          @user.email    = "Nome@hotmail.com"
          @user.cpf    = "123.456.789-00"
          @user.numerosus    = "123456789"
          @user.senha = "S3nh4 1234#"
     end

    context "Criar novo usuario" do

        it "deve existir somente um usuario por numerosus" do
           @user.save
           quantidade = Usuario.where(numerosus: @user.numerosus).count
           expect(quantidade == 1)
        end

		it "deve existir somente um usuario por CPF" do
           @user.save
           quantidade = Usuario.where(numerosus: @user.cpf).count
           expect(quantidade == 1)
        end
        
        it "deve existir somente um usuario por email" do
           @user.save
           quantidade = Usuario.where(numerosus: @user.email).count
           expect(quantidade == 1)
        end


    end


end
