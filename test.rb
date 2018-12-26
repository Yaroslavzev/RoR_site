
#puts ap Event.first(2)
data = {search_city: "New Dot", search_subject: "wh",  search_start_end: "26 Dec 2018"}#, :search_start, :search_end,:search_subject)

#puts data[:search_city]


p Event.search(data)


#puts ap Event.first.title.include? data[:search_subject]
