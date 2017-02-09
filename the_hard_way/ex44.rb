class Parent
    def implicit( )
        puts "PARENT implicit( )."
    end

    def override( )
        puts "PARENT override( )."
    end

    def altered( )
        puts "PARENT altered( )."
    end
end

class Child < Parent
    def override( )
        puts "CHILD override( )."
    end

    def altered( )
        puts "CHILD, before PARENT altered( )."
        super( )
        puts "CHILD, after PARENT altered( )."
    end
end

dad = Parent.new( )
son = Child.new( )

dad.implicit( )
son.implicit( )

dad.override( )
son.override( )

dad.altered( )
son.altered( )
