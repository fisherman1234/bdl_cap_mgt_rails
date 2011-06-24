# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ruby-ole}
  s.version = "1.2.11.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Charles Lowe}]
  s.date = %q{2010-10-24}
  s.description = %q{A library for easy read/write access to OLE compound documents for Ruby.}
  s.email = %q{aquasync@gmail.com}
  s.executables = [%q{oletool}]
  s.extra_rdoc_files = [%q{README}, %q{ChangeLog}]
  s.files = [%q{bin/oletool}, %q{README}, %q{ChangeLog}]
  s.homepage = %q{http://code.google.com/p/ruby-ole}
  s.rdoc_options = [%q{--main}, %q{README}, %q{--title}, %q{ruby-ole documentation}, %q{--tab-width}, %q{2}]
  s.require_paths = [%q{lib}]
  s.rubyforge_project = %q{ruby-ole}
  s.rubygems_version = %q{1.8.5}
  s.summary = %q{Ruby OLE library.}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
