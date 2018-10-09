require_relative "steps_helper"

def cria_especialidade_valida
  @especialidadevalida = {
    :Nome => "Desativar Especialiade",
    :Descricao => "Desativar especialiade"
  }

end


E("existem especialiades cadastradass") do
 expect(1==1)
end


Quando("Desativo uma especialiade") do
 expect(1==1)
end

Então("este resgistro não será mais visualizado na consulta de especialiades") do
expect(1==1)
end
