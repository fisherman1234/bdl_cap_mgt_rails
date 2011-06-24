# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{delocalize}
  s.version = "0.2.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Clemens Kofler}]
  s.date = %q{2011-05-26}
  s.description = %q{Delocalize is a tool for parsing localized dates/times and numbers.}
  s.email = %q{clemens@railway.at}
  s.extra_rdoc_files = [%q{README.markdown}]
  s.files = [%q{README.markdown}]
  s.homepage = %q{http://github.com/clemens/delocalize}
  s.require_paths = [%q{lib}]
  s.rubygems_version = %q{1.8.5}
  s.summary = %q{Localized date/time and number parsing}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
