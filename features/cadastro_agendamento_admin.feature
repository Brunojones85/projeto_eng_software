#language:pt
Funcionalidade: Cadastrar informações para agendamento de consulta
Como usuário administrador,
para que os pacientes possam marcar consultas médica,
quero cadastrar as informações de agendamento de consulta com especialidade médica, local, médico, data e hora.

Cenário: Cadastrar informações para agendar consultas com sucesso (Cenário Feliz)
Dado que eu cadastrei informações para agendar consultas para determinado dia e horário
Então eu vou conseguir ver essas informações na página de cadastro de informações


Cenário: Erro ao inserir informações inválidas para agendar consultas (Cenário Triste)
Dado que eu fiz a submissão de informações inválidas no de cadastro de informações para agendamento consultas
Então eu vou ver uma mensagem de erro na página de cadastro de informações de consulta
