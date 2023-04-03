# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.
require 'rdoc/task'

RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'docs'
  rdoc.rdoc_files.include('README.md', 'app/**/*.rb')
  rdoc.title = 'Mitify'
  rdoc.options << "--all"
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.options << '--exclude' << 'application_cable'
  rdoc.options << '--exclude' << 'application_job'
  rdoc.options << '--exclude' << 'application_mailer'
  rdoc.options << '--exclude' << 'application_record'
  rdoc.options << '--exclude' << 'members_controller'
end

task default: :rdoc

require_relative "config/application"

Rails.application.load_tasks
