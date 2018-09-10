Feature: Login Valido
  Testa Funcionalide de Login Valido (Exemplo:https://github.com/RailsApps/rails3-devise-rspec-cucumber/blob/master/features/users/sign_in.feature)

  Scenario: User signs in successfully
    Given Eu sou um usuario existente
    And Eu nao estou logado
    When Eu logo com credenciais validas
    Then Eu vejo uma msg login realizado com sucesso
    When Eu entro na pagina inicial
    Then Eu devo estar logado
    
