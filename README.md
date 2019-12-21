# Knossos
A library for generating mazes inspired by [_Mazes for Programmers_][mfp] by
Jamis Buck and [_Think Labyrinth!_][tlab] by Walter Pullen.

## Installation
Add the following line to your application's Gemfile:
```bash
gem 'knossos'
```
Or install the library globally with:
```bash
~$ gem install knossos
```

## Usage

## Contributing
Bug reports and pull requests are welcome on [GitHub][orig]. Knossos provides
a safe, welcoming space for collaboration. Everyone contributing to our
project—including the codebase, issue trackers, chat, email, social media and
the like—is expected to uphold our [Code of Conduct][coc].

### Setting Up
[Fork the project][fork] on GitHub and make a local clone. Install dependencies,
and run the tests:
```bash
~/knossos$ bin/setup
~/knossos$ bundle exec rake rspec
```

### Running the Code
You can experiment with the code interactively using:
```bash
~/knossos$ bin/console
irb> puts Knossos::BinaryTree.carve(Knossos::Grid.new())
```

### Publishing
To release a new version of the library, first increment the version number in
`lib/knossos/version.rb` following [Semantic Versioning][semv] policy, and
update `CHANGELOG.md`. Commit your work, and finally, run:
```bash
# Create a git tag, push commits and tags, and publish to rubygems.org
~/knossos$ bundle exec rake release
```

## License
This gem is available as open source under the terms of the [MIT License][mit].

---
_This file is composed with [GitHub Flavored Markdown][gfm]._

[coc]:  https://github.com/petejh/knossos/blob/master/CODE_OF_CONDUCT.md
[fork]: https://help.github.co://help.github.com/en/github/getting-started-with-github/fork-a-repo
[gfm]:  https://github.github.com/gfm/
[orig]: https://github.com/petejh/knossos
[mfp]:  https://pragprog.com/book/jbmaze/mazes-for-programmers
[mit]:  https://github.com/petejh/knossos/blob/master/LICENSE.txt
[semv]: https://semver.org
[tlab]: http://astrolog.org/labyrnth.htm
