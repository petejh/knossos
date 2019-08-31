# Amaze

Maze-generating code inspired by [_Mazes for Programmers_][mfp] by Jamis Buck.

### Setting Up

Install dependencies
```bash
~$ bundle install --binstubs
```

### Running tests
```bash
~$ bin/rspec
```

### Running the code
```bash
~$ irb -I./lib -r cell.rb -r grid.rb -r binary_tree.rb
irb> puts BinaryTree.carve(Grid.new({:rows => 5, :columns => 5}))
```

---
_This file uses [GitLab Flavored Markdown][gfm]._

[mfp]: https://pragprog.com/book/jbmaze/mazes-for-programmers
[gfm]: https://docs.gitlab.com/ee/user/markdown.html
