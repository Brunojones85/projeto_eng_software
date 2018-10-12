# coding: utf-8
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.
# coding: iso-8859-1

require 'rubygems'
require 'bundler' 
require 'cucumber'
require 'cucumber/rake/task'
#require 'test'
require_relative 'config/application'


Rails.application.load_tasks

Rake::Task['db:drop'].execute
Rake::Task['db:create'].execute
Rake::Task['db:migrate'].execute
Rake::Task['nossastasks:cria_usuario_admin'].execute
Rake::Task['nossastasks:popula_usuarios_testar_cenario_login_com_credenciais_validas'].execute
Rake::Task['nossastasks:popula_usuarios_aleatorios_para_testes'].execute
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


