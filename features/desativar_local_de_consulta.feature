#language:pt

Funcionalidade: Desativar local de consulta médica
Como usuário administrador
Para que seja possível a exclusão do local da consulta médica nas opções de local para o usuário
Eu quero desativar um local de consulta no cadastro

Cenário: Desativar de consulta com sucesso (Cenário Feliz)
Dado que eu estou logado
Quando acesso a página de listagem de locais de consulta
E escolho desativar
Então eu não vou conseguir ver o local na página de listagem de locais de consulta
