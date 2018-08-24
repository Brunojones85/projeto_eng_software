# coding: iso-8859-1
module FridayStepHelper
  def is_it_friday?(day)
    if day == 'Friday'
      "Legal E Sexta Sim!!!"
    else
      "Ainda Nao"
    end
  end
end

#https://docs.cucumber.io/cucumber/state/#world-object
#Isso permite que a gente chame os metodos definidos em FridayStepHelper nos nossos steps abaixo (Given,When e Then)
World(FridayStepHelper)

Given("today is Sunday") do
  @today = 'Sunday'
end

Given("today is Friday") do
  #pending # Write code here that turns the phrase above into concrete actions
   @today = 'Friday'
end


When("I ask whether it's Friday yet") do
  #Coloca a resposta verdadeira numa variavel de instancia do objeto FridayStepHelper definido por World(FridayStepHelper)
  #Acho que é isso...
  @actual_answer = is_it_friday?(@today)
end

Then("I should be told {string}") do |expected_answer|
  expect(@actual_answer).to eq(expected_answer)
end

#Then("I should be told {string}") do |string|
#  #pending # Write code here that turns the phrase above into concrete actions
#  expect(@actual_answer).to eq(expected_answer)
#end
