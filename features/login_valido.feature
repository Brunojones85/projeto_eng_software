#language:pt
Funcionalidade: Login Valido
  Testa Funcionalide de Login Valido (Exemplo:https://github.com/RailsApps/rails3-devise-rspec-cucumber/blob/master/features/users/sign_in.feature)

  Cenário: Usuario faz login com sucesso
    Dado Eu sou um usuario existente
    E Eu nao estou logado
    Quando Eu logo com credenciais validas
    Então Eu vejo uma msg login realizado com sucesso
    Quando Eu entro na pagina inicial
    Então Eu devo estar logado
