#language:pt
Funcionalidade: Cadastro Medico Valido
  Testa Funcionalidade de Cadastro de Medico

  Cenário: Cadastro realizado com sucesso (Caminho Feliz)
    Dado Eu sou o Administrador
    E Eu estou logado
    Quando Eu acesso pagina de criar um novo medico
    E envio o formulario com dados validos
    Então na pagina principal recebo a mensagem de Medico cadastrado com sucesso!

  Cenário: Cadastro com dados obrigatorios faltando
    Dado Eu sou Administrador
    E Eu estou logado
    Quando envio o form de nova conta com todos os campos em branco
    Então recebo mensagems de erro para os seguintes campos:
      | Nome do Medico                  |
      | CRM                             |
      | Especialidades                  |
      | Locais de Atendimento           |
