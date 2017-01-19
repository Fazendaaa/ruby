=begin
                                Counting Sundays

    You  are  given  the  following  information,  but you may prefer to do some
    research for yourself.

        *   1 Jan 1900 was a Monday.
        *   Thirty days has September,
            April, June and November.
            All the rest have thirty-one,
            Saving February alone,
            Which has twenty-eight, rain or shine.
            And on leap years, twenty-nine.
        *   A  leap  year occurs on any year evenly divisible by 4, but not on a
            century unless it is divisible by 400.

    How many Sundays fell on the first of the month during the twentieth century
    ( 1 Jan 1901 to 31 Dec 2000 )?
=end

def counting_sundays( start, finish )
    s_mon, s_day, s_year = start
    f_mon, f_day, f_year = finish

    # => it will return the number of leap years
    leap_days = ( 1900..s_year ).
                select { | year | 0 != year % 400 && 0 == year % 4 }
    # => wich  weekday will be, given how many days has passed sience 1 Jan 1900
    # => until de 1 Jan s_year
    weekday = ( ( ( 8 * 31 + 3 * 30 + 28 ) * ( s_year - 1900 ) ) % 365 +
              leap_days.length ) % 7

    for year in s_year..f_year do
        for month in 1..12 do

        end
    end
end

counting_sundays( [ 1, 1, 1901 ], [ 12, 31, 2000 ] )
