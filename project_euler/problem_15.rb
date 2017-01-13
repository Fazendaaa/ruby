=begin
                                Lattice paths

    Starting  in  the top left corner of a 2×2 grid, and only being able to move
    to  the  right  and  down,  there  are  exactly 6 routes to the bottom right
    corner.

    see image at - https://projecteuler.net/project/images/p015.gif

    How many such routes are there through a 20×20 grid?

    note: these articles helped me out a lot:
        * http://www.robertdickau.com/lattices.html -- an overview
        * http://www.robertdickau.com/manhattan.html -- the trueth
=end

def number_of_lattice_paths( grid_size )
    return ( 1..2*grid_size ).inject { | result, item | result = result * item }/
    ( 1..grid_size ).inject { | result, item | result = result * item } ** 2
end

puts number_of_lattice_paths( 20 )
