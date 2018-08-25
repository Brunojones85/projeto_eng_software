# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.
# coding: iso-8859-1
require 'rubygems'
require 'bundler' 
require 'cucumber'
require 'cucumber/rake/task' 
require_relative 'config/application'

Rails.application.load_tasks




#task default: %w[cucumber]

task :hello do  
  puts "Hello world from Rakefile!"
end

#essa task cria a task com nome cucumber
#Cucumber::Rake::Task.new do |t|
  #PRECISA ENTENDER O QUE É ESSE PROFILE
  #t.profile = 'ruby' if Cucumber::RUBY
#end


