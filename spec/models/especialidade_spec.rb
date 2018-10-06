require 'rails_helper'

describe Especialidade  do
  it "é valido quando o campo Nome é preenchido" do 
     espec = Especialidade.new(Nome:'teste')
     expect( espec).to be_valid
  end 

       

   
end
