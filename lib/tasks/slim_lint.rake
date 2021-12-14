# frozen_string_literal: true

require 'slim_lint/rake_task'

SlimLint::RakeTask.new do |t|
  t.files = ['app/views']
  t.quiet = true # Don't display output from slim-lint to STDOUT
end
