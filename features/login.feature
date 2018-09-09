Feature: Login
  Testa Funcionalide de Login (Exemplo:https://gist.github.com/thuss/923307)

  Scenario: Login com credenciais INvalidas
    Given Convidado encontra na tela de login
    When O convidado preenche email with "asdfasdfasd"
    And preenche a senha com  with "123456"
    And pressiona o botao de entrar
    Then ainda na pagina de login recebe a mensagem de email ou senha invalida
