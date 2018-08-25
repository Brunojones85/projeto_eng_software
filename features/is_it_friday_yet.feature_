Feature: Is it Friday yet?
  Everybody wants to know when it's Friday

  Scenario: Sunday isn't Friday
    Given today is Sunday
    When I ask whether it's Friday yet
    Then I should be told "Ainda Nao"



  Scenario: Friday IS Friday
    Given today is Friday
    When I ask whether it's Friday yet
    Then I should be told "Legal E Sexta Sim!!!"
