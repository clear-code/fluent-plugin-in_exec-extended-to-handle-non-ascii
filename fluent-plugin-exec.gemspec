lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name    = "fluent-plugin-in_exec-extended-to-handle-non-ascii"
  spec.version = "1.0.0"
  spec.authors = ["Daijiro Fukuda"]
  spec.email   = ["fukuda@clear-code.com"]

  spec.summary       = %q{Extended version of the built-in in_exec plugin for collecting non-ASCII characters.}
  spec.description   = <<~EOF
    The built-in in_exec plugin of the current Fluentd (v1.17.0) can not collect non-ASCII characters.
    This gem replaces the built-in in_exec plugin and enables it.
    Note: In the future, the built-in in_exec would have the same feature.
    This Gem is intended to be used for Fluentd up to that version.
  EOF
  spec.homepage      = "https://github.com/clear-code/fluent-plugin-in_exec-extended-to-handle-non-ascii"
  spec.license       = "Apache-2.0"

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[test/ spec/ features/ .git .circleci appveyor Gemfile])
    end
  end
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.4.19"
  spec.add_development_dependency "rake", "~> 13.2.1"
  spec.add_development_dependency "test-unit", "~> 3.6.2"
  spec.add_runtime_dependency "fluentd", [">= 0.14.10", "< 2"]
end
