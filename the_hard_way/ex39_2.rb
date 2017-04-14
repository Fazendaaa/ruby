states = {
    'Oregon' => 'OR',
    'Florida' => 'FL',
    'California' => 'CA',
    'New York' => 'NY',
    'Michigan' => 'MI'
}

cities = {
    'CA' => 'San Francisco',
    'MI' => 'Detroid',
    'FL' => 'Jacksonville'
}

cities[ 'NY' ] = 'New York'
cities[ 'OR' ] = 'Portland'

puts '-' * 60
puts "NY state has: #{ cities[ 'NY' ] }."
puts "OR state has: #{ cities[ 'OR' ] }."

puts '-' * 60
puts "Michigan's abbreviation is: #{ states[ 'Michigan' ] }."
puts "Florida's abbreviation is: #{ states[ 'Florida' ] }."

puts '-' * 60
puts "Michigan has: #{ cities[ states [ 'Michigan' ] ] }."
puts "Florida has: #{ cities[ states [ 'Florida' ] ] }."

puts '-' * 60
states.each do | state, abbrev |
    puts "#{ state }  is abbreviated as #{ abbrev }."
end

puts '-' * 60
states.each do | state, abbrev |
    city = cities[ abbrev ]
    puts "#{ state }  is abbreviated as #{ abbrev } and has city #{ city }."
end

puts '-' * 60
state = states[ 'Texas' ]

if !state
    puts "Sorry, no Texas."
end

city = cities[ 'TX' ]
city ||= 'Does Not Exist'
puts "The city for the state 'TX' is: #{ city }."
