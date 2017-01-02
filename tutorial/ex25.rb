module Ex25
    def Ex25.break_words( stuff )
        return stuff.split( ' ' )
    end

    def Ex25.sort_words( words )
        return words.sort
    end

    def Ex25.print_first_word( words )
        puts words.shift
    end

    def Ex25.print_last_word( words )
        puts words.pop
    end

    def Ex25.sort_sentence( sentence )
        return Ex25.sort_words( Ex25.break_words( sentence ) )
    end

    def Ex25.print_first_and_last( sentence )
        words = Ex25.break_words( sentence )
        Ex25.print_first_word( words )
        Ex25.print_last_word( words )
    end

    def Ex25.print_first_and_last_sorted( sentence )
        words = Ex25.sort_sentence( sentence )
        Ex25.print_first_word( words )
        Ex25.print_last_word( words )
    end
end
