# frozen_string_literal: true

$LOAD_PATH.push File.expand_path("lib", __dir__)

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name = "decidim-stats"
  s.summary = "A module to gather statistics based on user behaviour"
  s.description = s.summary
  s.required_ruby_version = ">= 3.1"
  s.version = "0.0.3"
  s.authors = ["Marc Riera Casals"]
  s.email = ["mrc2407@gmail.com"]

  s.files = Dir["{app,config,db,lib}/**/*", "Rakefile", "README.md"]

  s.add_dependency "decidim-comments", "0.31.0.dev"
  s.add_dependency "decidim-core", "0.31.0.dev"
  s.add_dependency "decidim-proposals", "0.31.0.dev"

  s.add_development_dependency "decidim-dev", "0.31.0.dev"
  s.metadata["rubygems_mfa_required"] = "true"
end
