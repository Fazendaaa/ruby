module Other
    def implicit( )
        puts "OTHER implicit( )."
    end

    def override( )
        puts "OTHER override( )."
    end

    def Other.altered( )
        puts "OTHER altered( )."
    end
end

class Child
    include Other

    def override( )
        puts "CHILD override( )."
    end

    def altered( )
        puts "CHILD, before OTHER altered( )."
        Other.altered( )
        puts "CHILD, after OTHER altered( )."
    end
end

son = Child.new( )

son.implicit( )
son.override( )
son.altered( )
