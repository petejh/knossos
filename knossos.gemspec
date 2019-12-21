lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'knossos/version'

Gem::Specification.new do |spec|
  spec.name = 'knossos'
  spec.version = Knossos::VERSION
  spec.authors = ['Peter J. Hinckley']
  spec.email = ['petejh.code@q.com']

  spec.summary = 'A library for generating mazes.'
  spec.description = %W[
    A library for generating mazes inspired by "Mazes for Programmers"
    by Jamis Buck and "Think Labyrinth!" by Walter Pullen.
  ].join(' ')
  spec.homepage = 'https://github.com/petejh/knossos'
  spec.license = 'MIT'

  spec.metadata = {
    'homepage_uri' =>'https://github.com/petejh/knossos',
    'source_code_uri' => 'https://github.com/petejh/knossos',
    'changelog_uri' => 'https://github.com/petejh/knossos/CHANGELOG.md',
    'bug_tracker_uri' => 'https://github.com/petejh/knossos/issues'
  }

  spec.files = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z LICENSE.txt README.md CHANGELOG.md lib`.split("\x0")
  end
  spec.require_paths = ['lib']

  spec.required_ruby_version = '~> 2.6'
  spec.add_runtime_dependency 'chunky_png', '~> 1.3'
  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
