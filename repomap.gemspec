lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
require 'repomap'

Gem::Specification.new do |s|
  s.name     = "repomap"
  s.version  = Repomap::VERSION
  s.date     = Time.now.strftime('%Y-%m-%d')
  s.summary  = "Analyze file relationships in a git repository"
  s.homepage = "http://github.com/heelhook/repomap"
  s.email    = "heelhook@littleq.net"
  s.authors  = [ "Pablo Fernandez" ]
  s.has_rdoc = false

  s.files    = %w( README.md Rakefile LICENSE )
  s.files   += Dir.glob("lib/**/*")
  s.files   += Dir.glob("spec/**/*")

  s.require_paths = %w(lib)

  s.add_dependency "rugged"
  s.add_dependency "neography"
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec", "~> 2.12.0"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "rb-fsevent", "~> 0.9"

  s.description       = <<desc
Analyze file relationships in a git repository
desc
end