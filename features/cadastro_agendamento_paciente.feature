#language:pt
Funcionalidade: Cadastrar agendamento de consulta
Como usuário,
para que eu possa marcar uma consulta médica,
quero ter uma tela inicial de agendamento de consulta com opções de escolha da especialidade médica desejada, do local desejado, do médico desejado e escolha da data e da hora.

Cenário: Busca sem filtros
Dado que cliquei no botão de buscar sem adicionar nenhum filtro
Então eu vou ver uma mensagem indicando a obrigatoriedade dos filtros

@javascript
Cenário: Busca com filtro de estado, cidade e especialidade
Dado que existam dados de agendamento cadastrados
E eu escolho determinado estado, cidade e especialidade
Então eu vou ver a lista com os agendamentos correspondentes para aquela cidade, estado e especialidade
