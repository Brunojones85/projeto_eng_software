#language:pt
Funcionalidade: Consultar meus agendamentos

Como usuário,
para que eu possa consultar as minhas consultas médicas agendadas,
quero ter uma tela de consulta com todas as minhas consultas agendadas, cada uma com a Data, local, horário, especialidade médica e o nome do profissional.


Cenário: Usuário sem consultas marcadas
Dado que eu não possuo consultas agendadas
Quando eu acesso a página de minhas consultas
Então eu vou ver uma mensagem indicando que não tenho consultas agendadas

Cenário:  Usuário com consultas marcadas
Dado que eu possuo consultas agendadas
Quando eu acesso a página de minhas consultas
Então eu vou ver as informações sobre minhas consultas agendadas, com a Data, local, horário, especialidade médica e o nome do profissional.
