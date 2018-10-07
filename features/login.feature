#language:pt
Funcionalidade: Login
  Testa Funcionalide de Login (Exemplo:https://gist.github.com/thuss/923307)

  Cenário: Login com credenciais Invalidas
    Dado Convidado encontra na tela de login
    Quando O convidado preenche email with "asdfasdfasd"
    E preenche a senha com  with "123456"
    E pressiona o botao de entrar
    Então ainda na pagina de login recebe a mensagem de email ou senha invalida
