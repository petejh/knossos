 require 'grid'

 module AldousBroder
   def carve(grid)
     cell = grid.random_cell
     unvisited = grid.cell_count - 1

     while unvisited > 0
       neighbor = grid.neighborhood(cell).sample

       if neighbor.links.empty?
         grid.build_passage(cell, neighbor)
         unvisited -= 1
       end

       cell = neighbor
     end

     grid
   end

   module_function :carve
 end
