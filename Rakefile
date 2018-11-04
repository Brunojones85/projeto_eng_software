# coding: utf-8
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.
# coding: iso-8859-1

require 'rubygems'
require 'bundler'
#require 'cucumber'
#require 'cucumber/rake/task'
#require 'test'
require_relative 'config/application'


Rails.application.load_tasks

#Rake::Task['db:drop'].execute
#Rake::Task['db:create'].execute
#Rake::Task['db:migrate'].execute

# Justificativa pra nao rodar a nossastasks:cria_usuario_admin
# e que qdo a gente usa uma fixture que cria um administrador ocorre esse conflito abaixo
# onde  a fixtue nao funciona porque ta tentando inserir um usuario com o mesmo
# email do administrador
# neste caso me parece melhor continuar com a fixture e abrir mao de criar um usuario
# com essa nossa task porque a fixture tem a habilidade de criar o usuario apenas para um teste
# especifico e depois fazer o rollback dele o que melhora a questao da independencia dos testes
# Pelo mesmo motivo foi comentado tambe a taxk popula usuarios
#Failure/Error: @connection.async_exec(sql)
#
#     ActiveRecord::RecordNotUnique:
#       PG::UniqueViolation: ERRO:  duplicar valor da chave viola a restrição de unicidade "index_usuarios_on_email"
#       DETAIL:  Chave (email)=() já existe.
#       : DELETE FROM "usuarios";
#       INSERT INTO "usuarios" ("id", "nome", "numerosus", "cpf", "dtanasc", "telfixo", "telcel", "sexo", "created_at", "updated_at", "email", "encrypted_password", "reset_password_token", "reset_password_sent_at", "remember_created_at") VALUES (371500880, 'usuario1', '123456789', '123.123.123-12', '2018-09-09', '11 94444-4444', '11 9 9999-9999', 'male', '2018-09-09 00:00:00', '2018-09-09 00:00:00', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT), (1032857722, 'admin', '123456789', '123.123.123-13', '2018-09-09', '11 94444-4444', '11 9 9999-9999', 'male', '2018-09-09 00:00:00', '2018-09-09 00:00:00', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT)
#Rake::Task['nossastasks:cria_usuario_admin'].execute
#Rake::Task['nossastasks:popula_usuarios_testar_cenario_login_com_credenciais_validas'].execute
#Rake::Task['nossastasks:popula_usuarios_aleatorios_para_testes'].execute
#Rake::Task['cucumber:all']

#task default: ["nossastasks:prepara_db" "nossastasks:popula_usuarios" "nossastasks:popula_usuarios_para_testes"]
#task default: [":rodaNossasTasks_PreparaDb"]
#task default: %w[ nossasTasks_PreparaDb ]

#task default: %w[test]



# :spec task depends on clean and 'test-reports' tasks
# and takes args for tags and triggers
#RSpec::Core::RakeTask.new(:spec, [:tag, :triggers] => [:rspec,'nossasTasks_PreparaDb']) do |task, args|
#  task.rspec_opts = "--tag #{args[:tag]}"
#  # args is a Rake::TaskArguments object (NOT a hash)
#  ENV[TRIGGERS] = args[:triggers]
#end


#task :MensagemFromRakefile do
#  puts "MensagemFromRakefile: As taks que serao executadas na seguinte ordem: db:seed, cucumber"
#end

#essa task cria a task com nome cucumber
#Cucumber::Rake::Task.new(:features)  do |t|
#  #PRECISA ENTENDER O QUE É ESSE PROFILE
#  #  t.profile = 'ruby' if Cucumber::RUBY
#  #t.cucumber_opts = %w{--format progress}
#end
