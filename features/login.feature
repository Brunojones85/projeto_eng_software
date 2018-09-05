Feature: Login
  Testa Funcionalide de Login (Exemplo:https://gist.github.com/thuss/923307)

  Scenario: Login com credenciais validas
    Given Convidado encontra na tela de login
    When O convidado preenche "Usuario" with "<usuario>"
    And preenche "Senha" with "<senha>"
    And pressiona o botao de "Login"
    Then o nome dele deve constar na pagina como usuario logado na pagina principal
    And tambem deve ver a mensagem "<mensagem>"

      | usuario | senha      | pagina           | mensagem                    |
      | admin   | admin123   | Pagina Principal | Login realizado com sucesso |
      | denise  | denise123  | Pagina Principal | Login realizado com sucesso |
      | miguel  | miguel123  | Pagina Principal | Login realizado com sucesso |
      | wagner  | wagner123  | Pagina Principal | Login realizado com sucesso |
      | marcelo | marcelo123 | Pagina Principal | Login realizado com sucesso |

