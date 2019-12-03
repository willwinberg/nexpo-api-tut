# -*- encoding: utf-8 -*-
# stub: nexmo 5.5.0 ruby lib

Gem::Specification.new do |s|
  s.name = "nexmo".freeze
  s.version = "5.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "bug_tracker_uri" => "https://github.com/Nexmo/nexmo-ruby/issues", "changelog_uri" => "https://github.com/Nexmo/nexmo-ruby/blob/master/CHANGES.md", "homepage" => "https://github.com/Nexmo/nexmo-ruby", "source_code_uri" => "https://github.com/Nexmo/nexmo-ruby" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Nexmo".freeze]
  s.date = "2018-12-03"
  s.description = "Nexmo Client Library for Ruby".freeze
  s.email = ["devrel@nexmo.com".freeze]
  s.homepage = "https://github.com/Nexmo/nexmo-ruby".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.1.0".freeze)
  s.rubygems_version = "3.0.3".freeze
  s.summary = "This is the Ruby client library for Nexmo's API. To use it you'll need a Nexmo account. Sign up for free at https://www.nexmo.com".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<jwt>.freeze, ["~> 2"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 12.0"])
      s.add_development_dependency(%q<minitest>.freeze, ["~> 5.0"])
      s.add_development_dependency(%q<webmock>.freeze, ["~> 3.0"])
    else
      s.add_dependency(%q<jwt>.freeze, ["~> 2"])
      s.add_dependency(%q<rake>.freeze, ["~> 12.0"])
      s.add_dependency(%q<minitest>.freeze, ["~> 5.0"])
      s.add_dependency(%q<webmock>.freeze, ["~> 3.0"])
    end
  else
    s.add_dependency(%q<jwt>.freeze, ["~> 2"])
    s.add_dependency(%q<rake>.freeze, ["~> 12.0"])
    s.add_dependency(%q<minitest>.freeze, ["~> 5.0"])
    s.add_dependency(%q<webmock>.freeze, ["~> 3.0"])
  end
end
