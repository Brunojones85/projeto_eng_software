#language:pt

Funcionalidade: Incluir local de consulta
Como usuário administrador
Para que seja possivel a escolha do local da consulta medica pelo usuario
Eu quero adicionar um local de consulta no cadastro

Cenário: Incluir local de consulta com sucesso (Cenário Feliz)
Dado que eu criei um local de consulta
Então eu vou conseguir ver o novo local na página de listagem de locais de consultas


Cenário: Erro ao inserir local de consulta inválido (Cenário Triste)
Dado que eu estou logado
Quando acesso a página de cadastro de local de consulta
E faço a submissão do formulário com dados inválidos
Então eu vou visualizar uma mensagem de erro
