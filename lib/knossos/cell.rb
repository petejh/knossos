module Knossos
  class Cell
    attr_reader :row, :column, :links
    attr_accessor :contents

    def initialize(args = {})
      args = defaults.merge(args)

      @row = args[:row]
      @column = args[:column]
      @contents = args[:contents]

      @links = []
    end

    def link_to(cell)
      @links << cell
    end

    def linked?(cell)
      @links.include? cell
    end

    private

    def defaults
      {}
    end
  end
end
