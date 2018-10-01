Given("Convidado encontra na tela de login") do
  visit "usuarios/sign_in"  
end

And("O convidado preenche email with {string}") do |string|
  #fill_in 'Email' , with: string #mudei porque tava retornando ElementNotFound
#  find(:xpath,'//*[@id="usuario_email"]').set(string);
end

And("preenche a senha com  with {string}") do |string|
 # fill_in 'Password', with: string
end

And("pressiona o botao de entrar") do
  find(:xpath, "/html/body/div/div/form/button").click()
end


Then("ainda na pagina de login recebe a mensagem de email ou senha invalida") do
    expect(page).to have_content "Email ou senha inv"
end


