namespace :nossastasks do
  desc "Popula Tabela de Usuarios com usuario padrao admin senha admin123"
  task popula_usuarios: :environment do
    puts "desc Popula Tabela de Usuarios com usuario padrao admin senha admin123"
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
    puts "Popula Tabela de Usuarios de Testes conforme pano de testes necessarios pro cucumber"
    if Rails.env.test?
      10.times do |i|
        usuario = Usuario.create(
          nome: Faker::Name.name,
          numerosus: Faker::Number.number(10), #https://github.com/stympy/faker/blob/master/doc/number.md
          senha: Faker::Number.number(10),
          cpf: ""+Faker::Number.number(11).round.to_s,
          email: Faker::Internet.email,
          dtanasc:Faker::Date.birthday(18, 65), #https://github.com/stympy/faker/blob/master/doc/date.md
          telfixo: ""+Faker::Number.number(9).round.to_s, #https://github.com/stympy/faker/blob/master/doc/string.md
          telcel: ""+Faker::Number.number(10).round.to_s,
          sexo:Faker::Gender.binary_type, #https://github.com/stympy/faker/blob/master/doc/gender.md
          created_at:Time.now.to_datetime,
          updated_at:Time.now.to_datetime);
      end  
    else
      puts "Essa tasks so roda no Rails.env.test"
    end
  end

  #https://stackoverflow.com/questions/14663963/is-there-a-faster-way-to-write-this-rake-command-rake-dbdrop-dbcreate-dbmig
 
  desc "Configura banco no ambiente dev e test"
  task :prepara_db, [] => :environment do
    raise "Not allowed to run on production" if Rails.env.production?
        
    Rake::Task['db:drop'].execute
    Rake::Task['db:create'].execute
    Rake::Task['db:migrate'].execute
    Rake::Task['db:seed'].execute
  end
end



  
