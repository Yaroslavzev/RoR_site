
#puts ap Event.first(2)
data = {search_place: "ddd" , search_subject: "dd", search_start_beg: "", search_start_end: ""}#, :search_start, :search_end,:search_subject)

#puts data[:search_city]
#p Event.search(data)



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
#bbb = Event.new(xxx)
puts ap Comment.second.commentable
