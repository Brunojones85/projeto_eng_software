Feature: Cadastro Medico Valido
  Testa Funcionalidade de Cadastro de Medico

  Scenario: Cadastro realizado com sucesso (Caminho Feliz)
    Given Eu sou o Administrador
    And Eu estou logado
    When Eu acesso pagina de criar um novo medico
    And envio o formulario de medico com dados validos
    Then na pagina principal recebo a mensagem de Medico cadastrado com sucesso!


  Scenario: Editar Medico com especialidade duplicada (Deve Falhar)
    Given Eu sou o Administrador
    And Eu estou logado
    When Eu cadastro uma especialidade
    And Eu cadastro um medico com esta especialidade
    And Eu clico em voltar para ir ate a pagina que lista medicos
    And Eu clico em editar o medico que eu inseri
    And Eu seleciono a mesma especialidade existente que o medico ja tem
    And Eu clico em atualizar medico
    Then Recebo a msg medico atualizado com sucesso mas sem especialidades repetidas
    


  Scenario: Cadastro com dados obrigatorios faltando
    Given Eu sou Administrador
    And Eu estou logado
    When envio o form de novo medico com todos os campos em branco
    Then recebo mensagems de erro na pagina de cadastro de medico para os seguintes campos:
      | Nome - Campo obrigatorio     | 
      | Crm - Campo obrigatorio      | 
      | Local - Campo obrigatorio    | 
      | Email - Campo obrigatorio    | 
      | Email                        | 
      | Sexo - Campo obrigatorio     | 
      | Situacao - Campo obrigatorio | 


 Scenario: Acesso direto sem estar logado
    Given Eu sou um convidado
    And Eu nao estou logado
    When Eu acesso pagina de criar um novo medico sem estar logado
    Then sou redirecionada para a pagina de login de usuario
