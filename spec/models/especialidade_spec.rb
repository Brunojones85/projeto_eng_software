require 'rails_helper'

describe Especialidade  do
  it "É valido quando o campo Nome é preenchido" do 
     espec = Especialidade.new(Nome:'teste')
     expect( espec).to be_valid
  end 

  it "Criar uma especialiade" do 
     espec = Especialidade.new(Nome:'teste2',Descicao:"Descricao de uma especialidade")
     expect( espec).to be_valid
  end  
 
   
end
