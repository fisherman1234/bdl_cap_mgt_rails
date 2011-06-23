# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{Ascii85}
  s.version = "1.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Johannes Holzfuß}]
  s.date = %q{2011-05-05}
  s.description = %q{Ascii85 provides methods to encode/decode Adobe's binary-to-text encoding of the same name.}
  s.email = %q{DataWraith@web.de}
  s.executables = [%q{ascii85}]
  s.extra_rdoc_files = [%q{README.rdoc}]
  s.files = [%q{bin/ascii85}, %q{README.rdoc}]
  s.homepage = %q{http://rubyforge.org/projects/ascii85/}
  s.licenses = [%q{MIT}]
  s.require_paths = [%q{lib}]
  s.rubyforge_project = %q{Ascii85}
  s.rubygems_version = %q{1.8.5}
  s.summary = %q{Ascii85 encoder/decoder}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, [">= 1.0.0"])
      s.add_development_dependency(%q<rspec>, [">= 2.4.0"])
    else
      s.add_dependency(%q<bundler>, [">= 1.0.0"])
      s.add_dependency(%q<rspec>, [">= 2.4.0"])
    end
  else
    s.add_dependency(%q<bundler>, [">= 1.0.0"])
    s.add_dependency(%q<rspec>, [">= 2.4.0"])
  end
end
