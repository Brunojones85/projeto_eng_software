require_relative "steps_helper"

#Cenário: Cadastrar informações para agendar consultas com sucesso (Cenário Feliz)

Dado("que eu cadastrei informações para agendar consultas para determinado dia e horário") do
  cria_info_agendamento_valido
end

Então("eu vou conseguir ver essas informações na página de cadastro de informações") do
  pending # Write code here that turns the phrase above into concrete actions
end



#Cenário: Erro ao inserir informações inválidas para agendar consultas (Cenário Triste)

Dado("que eu fiz a submissão de informações inválidas no de cadastro de informações para agendamento c
onsultas") do
  pending # Write code here that turns the phrase above into concrete actions
end

Então("eu vou ver uma mensagem de erro na página de cadastro de informações de consulta") do
  pending # Write code here that turns the phrase above into concrete actions
end
