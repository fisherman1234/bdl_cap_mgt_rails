# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{pdf-reader}
  s.version = "0.9.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{James Healy}]
  s.date = %q{2011-04-23}
  s.description = %q{The PDF::Reader library implements a PDF parser conforming as much as possible to the PDF specification from Adobe}
  s.email = [%q{jimmy@deefa.com}]
  s.executables = [%q{pdf_object}, %q{pdf_text}, %q{pdf_list_callbacks}]
  s.extra_rdoc_files = [%q{README.rdoc}, %q{TODO}, %q{CHANGELOG}, %q{MIT-LICENSE}]
  s.files = [%q{bin/pdf_object}, %q{bin/pdf_text}, %q{bin/pdf_list_callbacks}, %q{README.rdoc}, %q{TODO}, %q{CHANGELOG}, %q{MIT-LICENSE}]
  s.homepage = %q{http://github.com/yob/pdf-reader}
  s.rdoc_options = [%q{--title}, %q{PDF::Reader Documentation}, %q{--main}, %q{README.rdoc}, %q{-q}]
  s.require_paths = [%q{lib}]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.7")
  s.rubygems_version = %q{1.8.5}
  s.summary = %q{A library for accessing the content of PDF files}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<roodi>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.1"])
      s.add_runtime_dependency(%q<Ascii85>, [">= 0.9"])
    else
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<roodi>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 2.1"])
      s.add_dependency(%q<Ascii85>, [">= 0.9"])
    end
  else
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<roodi>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 2.1"])
    s.add_dependency(%q<Ascii85>, [">= 0.9"])
  end
end
