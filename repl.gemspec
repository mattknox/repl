Gem::Specification.new do |s|
  s.name = %q{repl}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["matt knox"]
  s.date = %q{2008-11-14}
  s.description = %q{Repl makes it possible to change IRB's notion of self to be any object or class. }
  s.email = %q{matthewknox@gmail.com}
  s.homepage = %q{http://github.com/mattknox/repl}
  s.require_paths = ["lib"]
  s.files = ["lib/repl.rb"]
  s.rubygems_version = %q{1.2.0}
  s.summary = %q{}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if current_version >= 3 then
    else
    end
  else
  end
end