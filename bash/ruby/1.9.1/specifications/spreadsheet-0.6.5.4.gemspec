# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{spreadsheet}
  s.version = "0.6.5.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Masaomi Hatakeyama, Zeno R.R. Davatz}]
  s.date = %q{2011-04-18}
  s.description = %q{The Spreadsheet Library is designed to read and write Spreadsheet Documents.
As of version 0.6.0, only Microsoft Excel compatible spreadsheets are
supported. Spreadsheet is a combination/complete rewrite of the
Spreadsheet::Excel Library by Daniel J. Berger and the ParseExcel Library by
Hannes Wyss. Spreadsheet can read, write and modify Spreadsheet Documents.}
  s.email = [%q{mhatakeyama@ywesee.com, zdavatz@ywesee.com}]
  s.executables = [%q{xlsopcodes}]
  s.extra_rdoc_files = [%q{GUIDE.txt}, %q{History.txt}, %q{LICENSE.txt}, %q{Manifest.txt}, %q{README.txt}]
  s.files = [%q{bin/xlsopcodes}, %q{GUIDE.txt}, %q{History.txt}, %q{LICENSE.txt}, %q{Manifest.txt}, %q{README.txt}]
  s.homepage = %q{http://spreadsheet.rubyforge.org}
  s.rdoc_options = [%q{--main}, %q{README.txt}]
  s.require_paths = [%q{lib}]
  s.rubyforge_project = %q{spreadsheet}
  s.rubygems_version = %q{1.8.5}
  s.summary = %q{The Spreadsheet Library is designed to read and write Spreadsheet Documents}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<ruby-ole>, [">= 1.0"])
      s.add_development_dependency(%q<hoe>, [">= 2.9.1"])
    else
      s.add_dependency(%q<ruby-ole>, [">= 1.0"])
      s.add_dependency(%q<hoe>, [">= 2.9.1"])
    end
  else
    s.add_dependency(%q<ruby-ole>, [">= 1.0"])
    s.add_dependency(%q<hoe>, [">= 2.9.1"])
  end
end
