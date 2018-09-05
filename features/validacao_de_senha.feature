Feature: Validar Senha
  Funcionalidade de validacao de senha


  Scenario: 2-Verifica a senha de string vazia � realmente rejeitada por ter menos que 1 digito
    Given senha ""
    When ocorrer a validacao
    Then deve retornar "false"

  Scenario: 3-verifica se a passa por ter 1 digito e tamb�m por ter o primeiro caractere valido
    Given senha "a"
    When ocorrer a validacao
    Then deve retornar "true"

  Scenario: 4-verifica se a senha abcde passa por ter 5 digitos e a primeira ser valida
    Given senha "abcde"
    When ocorrer a validacao
    Then deve retornar "true"

  Scenario: 5-verifica se a senha abcdef passa por ter 6 digitos e a primeira ser valida
    Given senha "abcdef"
    When ocorrer a validacao
    Then deve retornar "true"

  Scenario: 6-verifica se a senha abcdefg � rejeitado porque tem 7 d�gitos
    Given senha "abcdefg"
    When ocorrer a validacao
    Then deve retornar "false"

  Scenario: 7-verifica se a senha abcdefg � rejeitado porque tem 7 d�gitos
    Given senha "abcdefg"
    When ocorrer a validacao
    Then deve retornar "false"

  Scenario: 8-verifica se a senha a1c � aceita porque o digito � o primeiro caractere da senha
    Given senha "a1c"
    When ocorrer a validacao
    Then deve retornar "true"

  Scenario: 9-verifica se a senha abc* � rejeitada porque fere a regra de ter so digitos e caracteres
    Given senha "abc*"
    When ocorrer a validacao
    Then deve retornar "false"

  Scenario: 1,7-Valida se a senha abc passa por estar entre zero e 6 caracteres
    Given senha "abc"
    When ocorrer a validacao
    Then deve retornar "true"
