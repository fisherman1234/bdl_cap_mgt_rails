# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{prawn}
  s.version = "0.11.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Gregory Brown}, %q{Brad Ediger}, %q{Daniel Nelson}, %q{Jonathen Greenberg}, %q{James Healy}]
  s.date = %q{2011-04-03}
  s.description = %q{  Prawn is a fast, tiny, and nimble PDF generator for Ruby
}
  s.email = [%q{gregory.t.brown@gmail.com}, %q{brad@bradediger.com}, %q{dnelson@bluejade.com}, %q{greenberg@entryway.net}, %q{jimmy@deefa.com}]
  s.extra_rdoc_files = [%q{HACKING}, %q{README}, %q{LICENSE}, %q{COPYING}]
  s.files = [%q{HACKING}, %q{README}, %q{LICENSE}, %q{COPYING}]
  s.homepage = %q{http://prawn.majesticseacreature.com}
  s.post_install_message = %q{
********************************************


A lot has changed since 0.8.4

Please read the changelog for details:

https://github.com/sandal/prawn/wiki/CHANGELOG


********************************************

}
  s.rdoc_options = [%q{--title}, %q{Prawn Documentation}, %q{--main}, %q{README}, %q{-q}]
  s.require_paths = [%q{lib}]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.7")
  s.rubyforge_project = %q{prawn}
  s.rubygems_version = %q{1.8.5}
  s.summary = %q{A fast and nimble PDF generator for Ruby}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<pdf-reader>, [">= 0.9.0"])
      s.add_runtime_dependency(%q<ttfunk>, ["~> 1.0.0"])
    else
      s.add_dependency(%q<pdf-reader>, [">= 0.9.0"])
      s.add_dependency(%q<ttfunk>, ["~> 1.0.0"])
    end
  else
    s.add_dependency(%q<pdf-reader>, [">= 0.9.0"])
    s.add_dependency(%q<ttfunk>, ["~> 1.0.0"])
  end
end
