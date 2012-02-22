# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{pdfkit}
  s.version = "0.5.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Jared Pace}, %q{Relevance}]
  s.date = %q{2011-06-17}
  s.description = %q{Uses wkhtmltopdf to create PDFs using HTML}
  s.email = [%q{jared@codewordstudios.com}]
  s.homepage = %q{http://github.com/jdpace/PDFKit}
  s.require_paths = [%q{lib}]
  s.rubyforge_project = %q{pdfkit}
  s.rubygems_version = %q{1.8.5}
  s.summary = %q{HTML+CSS -> PDF}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, ["~> 2.2.0"])
      s.add_development_dependency(%q<mocha>, [">= 0.9.10"])
      s.add_development_dependency(%q<rack-test>, [">= 0.5.6"])
    else
      s.add_dependency(%q<rspec>, ["~> 2.2.0"])
      s.add_dependency(%q<mocha>, [">= 0.9.10"])
      s.add_dependency(%q<rack-test>, [">= 0.5.6"])
    end
  else
    s.add_dependency(%q<rspec>, ["~> 2.2.0"])
    s.add_dependency(%q<mocha>, [">= 0.9.10"])
    s.add_dependency(%q<rack-test>, [">= 0.5.6"])
  end
end
