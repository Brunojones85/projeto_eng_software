#language:pt
Funcionalidade: Realizar agendamento de consulta

Como usuário,
para que eu possa realizar o agendamento de uma consulta médica,
quero selecionar um dos registros que é exibido na página de busca de consultas.

@javascript
Cenário: Consulta marcada com sucesso
Quando eu faço uma busca de agendamento de consultas
E seleciono marcar consulta para algum dos resultados
Então eu vou conseguir ver esse registro na página meus agendamentos
