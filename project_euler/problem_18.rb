=begin
                            Maximum path sum I

    By  starting at the top of the triangle below and moving to adjacent numbers
    on the row below, the maximum total from top to bottom is 23.

                                   3
                                  7 4
                                 2 4 6
                                8 5 9 3

    That is, 3 + 7 + 4 + 9 = 23.
    Find the maximum total from top to bottom of the triangle below:

                                  75
                                 95 64
                                17 47 82
                               18 35 87 10
                             20 04 82 47 65
                            19 01 23 75 03 34
                           88 02 77 73 07 63 67
                          99 65 04 28 06 16 70 92
                        41 41 26 56 83 40 80 70 33
                       41 48 72 33 47 32 37 16 94 29
                      53 71 44 65 25 43 91 52 97 51 14
                    70 11 33 28 77 73 17 78 39 68 17 57
                   91 71 52 38 17 14 91 43 58 50 27 29 48
                  63 66 04 68 89 53 67 30 73 16 69 87 40 31
                04 62 98 27 23 09 70 98 73 93 38 53 60 04 23

    NOTE:  As  there are only 16384 routes, it is possible to solve this problem
    by  trying  every  route.  However, Problem 67, is the same challenge with a
    triangle  containing  one-hundred  rows; it cannot be solved by brute force,
    and requires a clever method! ;o)

    note: articles that helped me out:
        * https://www.quora.com/What-is-an-algorithm-to-find-a-longest-path-in-a-unweighted-directed-acyclic-graph
        * http://cs.stackexchange.com/questions/11263/longest-path-in-an-undirected-tree-with-only-one-traversal/11264#11264
        * https://rosettacode.org/wiki/Dijkstra's_algorithm#Ruby
=end

# ------------------------------ STRUCTURES ------------------------------------

class Graph
    Vertex = Struct.new( :name, :neighbours, :dist, :prev )

    def initialize( graph )
        @vertices = Hash.new{ | h, k | h[ k ]= Vertex.new( k, [ ],
                                               Float::INFINITY ) }
        @edges = { }
        graph.each do | ( v1, v2, dist ) |
            @vertices[ v1 ].neighbours << v2
            @edges[ [ v1, v2 ] ] = @edges[ [ v2, v1 ] ] = dist
        end

        @dijkstra_source = nil
   end

   # => instead  of  returning  the  shortest  'possible'  path, it will return the
   # => longest
   def dijkstra( source )
       return  if @dijkstra_source == source

       q = @vertices.values

       q.each do | v |
           v.dist = Float::INFINITY
           v.prev = nil
       end

       @vertices[ source ].dist = 0

       until q.empty?
           u = q.min_by { | vertex | vertex.dist }

           break if u.dist == Float::INFINITY

           q.delete(u)

           u.neighbours.each do | v |
               vv = @vertices[ v ]

               if q.include?( vv ) then
                   alt = u.dist + @edges[ [ u.name, v ] ]

                   if alt < vv.dist
                       vv.dist = alt
                       vv.prev = u.name
                   end
               end
           end
       end

       @dijkstra_source = source
   end

    def shortest_path( source, size )
        dijkstra( source )
        path = []

        for i in 1..size
            path.unshift( u )
            u = @vertices[ u ].prev
        end

        return path, @vertices[ target ].dist
    end

    def to_s
        "#<%s vertices=%p edges=%p>" % [self.class.name, @vertices.values, @edges]
    end
end

# --------------------------------- MAIN ---------------------------------------

def maximum_path_sum_i( triangle )
    i = j = 0

    for line in triangle do
        if triangle.length > j then
            for element in line do
                source = "#{i},#{j}"
                left_son = "#{i+1},#{j}"
                right_son = "#{i+1},#{j+1}"
                if triangle.length > i + 1 then
                    left_value = triangle[ i + 1 ][ j ]
                    right_value = triangle[ i + 1 ][ j + 1 ]
                else
                    left_value = nil
                    right_value = nil
                end
                triangle[ i ][ j ] = [ source, left_son, left_value, nil ]
                triangle[ i ][ j ] = [ source, right_son, right_value, nil ]
                j = j + 1
            end
        end
        j = 0
        i = i + 1
    end

    g = Graph.new( triangle )
    path, dist = g.shortest_path( triangle[ 0 ][ 0 ], triangle.length*triangle.length-1 )
    puts "shortest path from has cost #{dist}:"
    puts path.join(" -> ")
end

input_i = "3
          7 4
         2 4 6
        8 5 9 3".lines.map { | line | line.split.map( &:to_i ) }

maximum_path_sum_i( input_i )
