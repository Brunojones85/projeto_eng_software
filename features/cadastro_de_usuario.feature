#language:pt
Funcionalidade: Login Valido
  Testa Funcionalide de Cadastro de Usuario

  Cenário: Cadastro realizado com sucesso (Caminho Feliz)
    Dado Eu sou convidado
    E Eu nao estou logado
    Quando Eu acesso pagina de criar uma nova conta
    E envio o formulario com dados validos
    Então na pagina principal recebo a mensagem de Seja bem-vindo com o nome do meu usuario

  Cenário: Cadastro com dados obrigatorios faltando
    Dado Eu sou convidado
    E Eu nao estou logado
    Quando envio o form de nova conta com todos os campos em branco
    Então recebo mensagems de erro para os seguintes campos: 
      | Email                                |
      | Password                             |
      | Nome                                 |
      | Numerosus                            |
      | Cpf                                  |


#    #Importante pra evitar que dois usuarios tenham numeros sus iguais
#    #A ideia desse teste � verificar se o sistema consegue detectar
#    #Numeros de sus repetido, cpfs repetidos e emails
#  Scenario: Cadastro com numero de sus ja pre existente
#    Given Eu sou convidado
#    And Eu nao estou logado
#    When Eu acesso pagina de criar uma nova conta
#    And preencho o campo nome with "NomeDeUsuarioParaTestaNumSusRepetido"
#    And preencho o campo numero sus com um numero que ja existe no sistema
#    And preencho o campo de cpf com um cpf que ja existe no sistema
#    And preencho o email com um email que ja e utilizado por outro usuario do sistema
#    And preencho a senha
#    And confirmo a senha
#    And clico no botao enviar
#    Then devo receber as mensagens
#     | Email j� est� em uso     |
#     | Numerosus j� est� em uso |
#     | Cpf j� est� em uso       |
