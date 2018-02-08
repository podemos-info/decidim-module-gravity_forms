# frozen_string_literal: true

$LOAD_PATH.push File.expand_path("lib", __dir__)

require "decidim/gravity_forms/version"

Gem::Specification.new do |s|
  s.version = Decidim::GravityForms.version
  s.authors = ["Your Name"]
  s.email = ["your_email@example.org"]
  s.license = "AGPL-3.0"
  s.homepage = "https://github.com/decidim/decidim-module-gravity_forms"
  s.required_ruby_version = ">= 2.3.1"

  s.name = "decidim-gravity_forms"
  s.summary = "A decidim gravity_forms module"
  s.description = "A gravity forms component for Decidim."

  s.files = Dir["lib/**/*", "Rakefile", "README.md"]

  s.add_dependency "decidim-core", Decidim::GravityForms.version
end
