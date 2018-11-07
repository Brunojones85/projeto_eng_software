require 'rails_helper'

describe Especialidade  do
  it "É valido quando o campo Nome e status é preenchido" do 
     espec = Especialidade.new(Nome:'teste', ativo:true)
     expect( espec).to be_valid
  end 

  it "Criar uma especialiade" do 
     espec = Especialidade.new(Nome:'teste2',Descricao:"Descricao de uma especialidade",ativo:true)
     expect( espec).to be_valid
  end  
 
   
end
