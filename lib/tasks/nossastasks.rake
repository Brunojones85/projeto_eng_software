namespace :nossastasks do
  desc "## [nossastasks.rake] Popula Tabela de Usuarios com usuario padrao admin senha admin123"
  task cria_usuario_admin: :environment do
    #puts "## [nossastasks.rake] Rodando Nossas Task 'cria_usuario_admin'"
      Usuario.create(
        nome: 'Admin',
        numerosus: 123,
        password: '123456',
        cpf: '123456',
        email: 'admin@amdin',
        dtanasc:Time.now.to_datetime, #https://stackoverflow.com/questions/5474164/rails-seeding-database-data-and-date-formats
        telfixo:'1234',
        telcel:'4321',
        sexo:'M',
        created_at:Time.now.to_datetime,
        updated_at:Time.now.to_datetime);    
    end

  desc "## [nossastasks.rake] NossaTaks Popula Tabela com usuarios aleatorios para Testes conforme"
  task popula_usuarios_aleatorios_para_testes: :environment do
    #puts "## [nossastaks.rake] Rodando Nossa Task 'popula_usuarios_aleatorios_para_testes'"
    if Rails.env.test?
      10.times do |i|
        Usuario.create(
          nome: Faker::Name.name,
          numerosus: Faker::Number.number(10), #https://github.com/stympy/faker/blob/master/doc/number.md
	  password: Faker::Internet.password,
	  cpf: Faker::CPF.numeric,
          email: Faker::Internet.email,
          dtanasc:Faker::Date.birthday(18, 65), #https://github.com/stympy/faker/blob/master/doc/date.md
          telfixo: Faker::PhoneNumber.phone_number, #https://github.com/stympy/faker/blob/master/doc/string.md
          telcel:Faker::PhoneNumber.cell_phone,
          sexo:Faker::Gender.binary_type, #https://github.com/stympy/faker/blob/master/doc/gender.md
          created_at:Time.now.to_datetime,
          updated_at:Time.now.to_datetime);
      end  
    else
      puts "Essa tasks so roda no Rails.env.test"
    end
  end

  desc "## [nossastasks.rake] NossaTaks Popula Tabela de Usuarios para tesde do cenario: Login com credenciais validas"
  task popula_usuarios_testar_cenario_login_com_credenciais_validas: :environment do
    #puts "Rodando nossaTask popula_usuarios_testar_cenario_login_com_credenciais_validas"
    if Rails.env.test?

      puts " Criando usuario Denise"
      Usuario.create(
        nome: 'denise',
        numerosus: Faker::Number.number(10),
	password: '123456',
	cpf: Faker::CPF.numeric,
        email: "denise@denise",
        dtanasc: Faker::Date.birthday(18, 65),
        telfixo: Faker::PhoneNumber.phone_number,
        telcel: Faker::PhoneNumber.cell_phone,
        sexo: Faker::Gender.binary_type,
        created_at:Time.now.to_datetime,
        updated_at:Time.now.to_datetime);

      puts "Criando usuario"
      Usuario.create(
        nome: 'admin',
        numerosus: Faker::Number.number(10),
	password: 'admin123',
	cpf: Faker::CPF.numeric,
        email: "admin@admin",
        dtanasc: Faker::Date.birthday(18, 65),
        telfixo: Faker::PhoneNumber.phone_number,
        telcel: Faker::PhoneNumber.cell_phone,
        sexo: Faker::Gender.binary_type,
        created_at:Time.now.to_datetime,
        updated_at:Time.now.to_datetime);

      puts "Criando usuario miguel"
      Usuario.create(
        nome: 'miguel',
        numerosus: Faker::Number.number(10),
	password: '123456',
	cpf: Faker::CPF.numeric,
        email: "miguel@miguel",
        dtanasc: Faker::Date.birthday(18, 65),
        telfixo: Faker::PhoneNumber.phone_number,
        telcel: Faker::PhoneNumber.cell_phone,
        sexo: Faker::Gender.binary_type,
        created_at:Time.now.to_datetime,
        updated_at:Time.now.to_datetime);

      puts "Criando usuario wagner"
      Usuario.create(
        nome: 'wagner',
        numerosus: Faker::Number.number(10),
	password: '123456',
	cpf: Faker::CPF.numeric,
        email:  "wagner@wagner",
        dtanasc: Faker::Date.birthday(18, 65),
        telfixo: Faker::PhoneNumber.phone_number,
        telcel: Faker::PhoneNumber.cell_phone,
        sexo: Faker::Gender.binary_type,
        created_at:Time.now.to_datetime,
        updated_at:Time.now.to_datetime);

      puts "Criando usuario marcelo"
      Usuario.create(
        nome: 'marcelo',
        numerosus: Faker::Number.number(10),
	password: '123456',
	cpf: Faker::CPF.numeric,
        email: "marcelo@marcelo",
        dtanasc: Faker::Date.birthday(18, 65),
        telfixo: Faker::PhoneNumber.phone_number,
        telcel: Faker::PhoneNumber.cell_phone,
        sexo: Faker::Gender.binary_type,
        created_at: Time.now.to_datetime,
        updated_at: Time.now.to_datetime);
    else
      puts "## [nossastasks.rake] Essa task so pode rodar no Rails.env.test"
      puts "## [nossastasks.rake] Qual task? A NossaTaks Popula Tabela de Usuarios para tesde do cenario: Login com credenciais validas"
    end
  end
  
#  https://stackoverflow.com/questions/14663963/is-there-a-faster-way-to-write-this-rake-command-rake-dbdrop-dbcreate-dbmig
#  OS COMANDOS DESTA TAG FORAM COLOCADOS DIRETAMENTE NO Rakefile 
#  desc "Configura banco no ambiente dev e test"
#  task :prepara_db, [] => :environment do
#    raise "Not allowed to run on production" if Rails.env.production?
        
#    Rake::Task['db:drop'].execute
#    Rake::Task['db:create'].execute
#    Rake::Task['db:migrate'].execute
#    Rake::Task['db:seed'].execute
#  end
end



  
