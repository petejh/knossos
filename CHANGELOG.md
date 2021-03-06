# Changelog
All notable changes to this project will be documented in this file.

This project uses [Semantic Versioning][sv].

## [Unreleased][new]

## [0.3.0][0.3.0] — 2020-01-26

### Added
- Add the `HuntAndKill` algorithm for generating mazes.
- `BinaryTree` accepts an option to configure the bias.
- Algorithms accept an argument to `#carve` to set the seed for the random number
  generator.
- Create a `Serializer` module to hold the methods that encode mazes for
  archiving and transfer.
- Add the `Bitmask` serializer to represent the maze as a matrix of integers,
  where each integer is a bitfield encoding the passage directions.
- Add `Bitmask#deserialize` to decode an array of bitmasked integers into a
  maze.
- Create a `Solver` module to hold algorithms that analyze or plot solutions to
  mazes.
- Create `Solver::Distances` helper class to store the distances from a root
  cell to any other cell in the maze.
- Add `Dijkstra#distances_from` to calculate the distances from a given cell to
  every other cell in the maze.
- Add `Dijkstra#shortest_path` to extract the shortest path from the starting
  cell to a given goal.
- Add `Dijkstra#longest_path` to find the longest path in the entire maze.
- Display all distances or the solution path within the rendered grid.

### Changed
- Change `carve` to be an instance method of the Algorithm classes.

### Fixed
- Update Usage in README with namespace changes.

## [0.2.0][0.2.0] — 2020-01-09

### Changed
- Correctly nest the `Algorithm` module within the `Knossos` namespace.
- Correctly nest the `Renderer` module within the `Knossos` namespace.

## [0.1.0][0.1.0] — 2020-01-07

### Added
- Create an `Algorithm` module to hold the maze generators.
- Create a `Renderer` module to hold the methods that produce graphical
representations of a maze.
- Create `Renderer::Text` to produce ASCII text representations.

### Changed
- Move `AldousBroder` to the `Algorithm` module.
- Move `BinaryTree` to the `Algorithm` module.
- Move `RecursiveBacktracker` to the `Algorithm` module.
- Move `Sidewinder` to the `Algorithm` module.
- Move `Wilsons` to the `Algorithm` module.
- Move and rename `Display` to `Renderer::Image`.
- Rename `Display.to_png` to `Image.render`.

### Fixed
- Correctly scope private class methods in `Sidewinder`.
- Algorithms now uniformly require a `grid:` keyword argument to `.carve`.

### Removed
- `Grid` no longer has a custom `to_s` method to produce a graphical maze.
  Use `Renderer::Text.render` instead.

## [0.0.0][0.0.0] — 2020-01-02

### Added
- Restructure the project as a Ruby gem.

---
_This file is composed with [GitHub Flavored Markdown][gfm]._

[gfm]: https://github.github.com/gfm/
[sv]: https://semver.org

[new]: https://github.com/petejh/knossos/compare/HEAD..v0.3.0
[0.3.0]: https://github.com/petejh/knossos/releases/tag/v0.3.0
[0.2.0]: https://github.com/petejh/knossos/releases/tag/v0.2.0
[0.1.0]: https://github.com/petejh/knossos/releases/tag/v0.1.0
[0.0.0]: https://github.com/petejh/knossos/releases/tag/v0.0.0
