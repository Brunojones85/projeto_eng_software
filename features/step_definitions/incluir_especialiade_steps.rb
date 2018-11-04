require_relative "steps_helper"

def cria_especialidade_valida
  @especialidadevalida = {
    :Nome => "Clinico geral",
    :Descricao => "Atendimento geral",
    :ativo => true
  }

end

def cria_especialiade_invalida
  @especialidadeinvalida = {
    :Nome => nil,
    :Descricao => "teste", 
    :ativo => true
  }
end

Quando("acesso a página de cadastro de especialidade") do
  visit "/especialidades/new"
end

Quando("faço o cadastro de uma especialidade") do
  cria_especialidade_valida
  fill_in "especialidade_Nome", :with => @especialidadevalida[:Nome]
  fill_in "especialidade_Descricao", :with => @especialidadevalida[:Descricao]
  fill_in "especialidade_ativo", :with => @especialidadevalida[:ativo]

  find(:xpath, "/html/body/form/div[9]/input").click
end 
Então("eu vou conseguir ver a nova especialidadecd") do
  visit "/especialidades/"
  page.find('td', text: @especialidadevalida[:Nome])
end

Quando("Tento cadastrar uma especialidade inválida") do
  especialidadeinvalida
  fill_in "especialiade_nome", :with => @especialidadeinvalida[:nome]
  fill_in "especialiade_Descricao", :with => @especialidadeinvalida[:Descricao]
  fill_in "especialiade_ativo", :with => @especialidadeinvalida[:ativo]
  find(:xpath, "/html/body/form/div[9]/input").click
end

Então("Visualizei o erro do cadastro") do
  page.find('h2',  text: 'error')
end
