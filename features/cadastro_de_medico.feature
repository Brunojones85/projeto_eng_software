Feature: Cadastro Medico Valido
  Testa Funcionalidade de Cadastro de Medico

  Scenario: Cadastro realizado com sucesso (Caminho Feliz)
    Given Eu sou o Administrador
    And Eu estou logado
    When Eu acesso pagina de criar um novo medico
    And envio o formulario com dados validos 
    Then na pagina principal recebo a mensagem de Medico cadastrado com sucesso!
    
  Scenario: Cadastro com dados obrigatorios faltando
    Given Eu sou Administrador
    And Eu estou logado
    When envio o form de nova conta com todos os campos em branco
    Then recebo mensagems de erro para os seguintes campos: 
      | Nome do Medico                  |
      | CRM                             |
      | Especialidades                  |
      | Locais de Atendimento           |

