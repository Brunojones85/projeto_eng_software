#language:pt

Funcionalidade: Cadastrar agendamento de consulta
Como usuário,
para que eu possa marcar uma consulta médica,
quero ter uma tela inicial de agendamento de consulta com opções de escolha da  especialidade médica desejada, do local desejado, do médico desejado e escolha da data e da hora.

Cenário: Busca sem filtros
Dado que existam dados de agendamento cadastrados
E eu executo uma busca sem filtros
Então eu vou ver a lista com todos os resultados de agendamento

Cenário: Busca com filtro de estado e cidade
Dado que existam dados de agendamento cadastrados
E eu escolho determinado estado e cidade
Então eu vou ver a lista com os agendamentos correspondentes para aquela cidade e estado


Cenário: Busca com filtro de estado, cidade e local
Dado que existam dados de agendamento cadastrados
E eu escolho determinado estado, cidade e local
Então eu vou ver a lista com os agendamentos correspondentes para aquela cidade, estado e local

Cenário: Busca com filtro de estado, cidade e especialidade medica
Dado que existam dados de agendamento cadastrados
E eu escolho determinado estado, cidade e especialidade medica
Então eu vou ver a lista com os agendamentos correspondentes para aquela cidade, estado e especialidade medica


Cenário: Busca com filtro de estado, cidade, local, especialidade medica e medico
Dado que existam dados de agendamento cadastrados
E eu escolho determinado estado, cidade, local, especialidade medica e medico
Então eu vou ver a lista com os agendamentos correspondentes para aquela cidade, estado, local, especialidade medica e medico
