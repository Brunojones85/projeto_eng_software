#language:pt
Funcionalidade: Desativar local de consulta médica
Como usuário administrador
Para que seja possível a exclusão do local da consulta médica nas opções de local para o usuário
Eu quero desativar um local de consulta

Cenário: Desativar de consulta com sucesso
Dado que eu criei um local de consulta
Quando acesso a página para editar o local de consulta cadastrado
E altero o status do registro para desativado
Então eu vou conseguir ver esse registro com o status desativado na página de listagem de locais de consulta
