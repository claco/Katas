begin
  require 'rcov'
rescue LoadError
  require 'rubygems' unless ENV['NO_RUBYGEMS']
  require 'rcov'
end

"Run all specs with rcov and store coverage report in doc/output/coverage"
Spec::Rake::SpecTask.new(:spec_rcov) do |t|
  t.spec_files = FileList['spec/**/*.rb']
  t.rcov = true
  t.rcov_dir = 'doc/output/coverage'
  t.rcov_opts = ['-t --exclude', 'spec,\.autotest,rcov.rb']
end
