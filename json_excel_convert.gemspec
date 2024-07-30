# frozen_string_literal: true

require_relative "lib/json_excel_convert/version"

Gem::Specification.new do |spec|
  spec.name          = "json_excel_convert"
  spec.version       = "0.1.0"
  spec.authors       = ["Dinesh Kandregula"]
  spec.email         = ["kandreguladinesh1987@gmail.com"]

  spec.summary       = %q{Convert JSON data to Excel and vice versa}
  spec.description   = %q{A gem to convert JSON data to Excel files and vice versa.}
  spec.homepage      = "https://example.com/json_excel_convert"
  spec.required_ruby_version = ">= 2.4.0"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_dependency 'caxlsx_rails', '~> 0.6.2'
  spec.add_development_dependency "rspec", "~> 3.10"
  spec.add_dependency "roo", "~> 2.8"

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
