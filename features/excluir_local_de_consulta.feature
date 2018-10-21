#language:pt

Funcionalidade: Excluir local de consulta médica
Como usuário administrador
Para que seja possível a exclusão do local da consulta médica nas opções de local para o usuário
Eu quero excluir um local de consulta no cadastro

Cenário: Excluir de consulta com sucesso (Cenário Feliz)
Dado que eu criei um local de consulta
Quando acesso a página de listagem de locais de consulta
E escolho excluir para um determinado registro
Então eu não vou conseguir mais ver esse registro na página de listagem de locais de consulta
