# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{wkhtmltopdf-binary}
  s.version = "0.9.5.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Research Information Systems, The University of Iowa"]
  s.date = %q{2011-05-06}
  s.default_executable = %q{wkhtmltopdf}
  s.email = %q{vpr-ris-developers@iowa.uiowa.edu}
  s.executables = ["wkhtmltopdf"]
  s.files = ["bin/wkhtmltopdf", "bin/wkhtmltopdf_linux_386", "bin/wkhtmltopdf_darwin_386", "bin/wkhtmltopdf-binary.rb"]
  s.require_paths = ["."]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Provides binaries for WKHTMLTOPDF project in an easily accessible package.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
