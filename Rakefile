# coding: iso-8859-1
require 'rubygems'
require 'bundler' 
require 'cucumber'
require 'cucumber/rake/task' 


task default: %w[cucumber]

task :hello do  
  puts "Hello world from Rakefile!"
end

#essa task cria a task com nome cucumber
Cucumber::Rake::Task.new do |t|
  #PRECISA ENTENDER O QUE É ESSE PROFILE
  #t.profile = 'ruby' if Cucumber::RUBY
end


