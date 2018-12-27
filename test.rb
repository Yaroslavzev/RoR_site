
#puts ap Event.first(2)
data = {search_city: "" , search_subject: "wh", search_start_beg: "25 Dec 2018", search_start_end: "26 Dec 2018"}#, :search_start, :search_end,:search_subject)

#puts data[:search_city]
ss = Event.search(data)


#p data[:search_city]

#p ss
#p ss.compact.inject {|total, object| total & object.compact}#.empty?#Event.search(data).empty?


#puts ap Event.first.title.include? data[:search_subject]

#print_out = ["The city ", "Start time range ", "The subject "]
#
#ss.each_with_index do |object, index|
#  if object.nil?
#    puts (print_out[index] + "has not been entered" )
#
#  elsif
#    puts (print_out[index] + "has not been found" if object.kind_of?(Array) & object.compact.empty?)
#end
#end

p [true, true, true, true].true?
