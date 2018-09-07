namespace :nossastasks do
  desc "Popula Tabela de Usuarios com usuario padrao admin senha admin123"
  task popula_usuarios: :environment do
      Usuario.create(
        nome: 'Admin',
        numerosus: 123,
        senha: 'admin123',
        cpf: '123456',
        email: 'admin@amdin',
        dtanasc:Time.now.to_datetime, #https://stackoverflow.com/questions/5474164/rails-seeding-database-data-and-date-formats
        telfixo:'1234',
        telcel:'4321',
        sexo:'M',
        created_at:Time.now.to_datetime,
        updated_at:Time.now.to_datetime);    
    end

  desc "Popula Tabela de Usuarios de Testes conforme pano de testes necessarios pro cucumber"
  task popula_usuarios_para_testes: :environment do
    if Rails.env.test?
      10.times do |i|
        usuario = Usuario.create(
          nome: Faker::Name.name,
          numerosus: Faker::Number.number(10), #https://github.com/stympy/faker/blob/master/doc/number.md
          senha: Faker::String.random(4),
          cpf: Faker::String.random(11),
          email: Faker::Internet.email,
          dtanasc:Faker::Date.birthday(18, 65), #https://github.com/stympy/faker/blob/master/doc/date.md
          telfixo: Faker::String.random(4), #https://github.com/stympy/faker/blob/master/doc/string.md
          telcel:Faker::String.random(4),
          sexo:Faker::Gender.binary_type, #https://github.com/stympy/faker/blob/master/doc/gender.md
          created_at:Time.now.to_datetime,
          updated_at:Time.now.to_datetime);
      end  
    else
      puts "Essa tasks so roda no Rails.env.test"
    end
  end
end
  
