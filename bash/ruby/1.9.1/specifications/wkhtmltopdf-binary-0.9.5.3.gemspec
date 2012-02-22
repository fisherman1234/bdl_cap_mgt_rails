# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{wkhtmltopdf-binary}
  s.version = "0.9.5.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Research Information Systems, The University of Iowa}]
  s.date = %q{2011-05-06}
  s.email = %q{vpr-ris-developers@iowa.uiowa.edu}
  s.executables = [%q{wkhtmltopdf}]
  s.files = [%q{bin/wkhtmltopdf}]
  s.require_paths = [%q{.}]
  s.rubygems_version = %q{1.8.5}
  s.summary = %q{Provides binaries for WKHTMLTOPDF project in an easily accessible package.}

  if s.respond_to? :specification_version then
    s.specification_version = 2

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
