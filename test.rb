
#puts ap Event.first(2)
data = {search_place: " " , search_subject: "", search_start_beg: "", search_start_end: ""}#, :search_start, :search_end,:search_subject)

#puts data[:search_city]
#p Event.search(data)

#search_place: "ddd" , search_subject: "dd", search_start_beg: "", search_start_end: "" user_id

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
#bbb = Event.search(Search.last.attributes.except("id", "user_id", "created_at", "updated_at" ))
#puts ap Event.last

#Search.all.each do |object|
#  puts object.attributes.except("id", "user_id", "created_at", "updated_at" ).map {|key, object| {"#{key}": object.to_s}}.reduce(:merge)#.delete_if {|key, object| object.empty?}
#end
#puts pp
#puts User.first.email
#@event = Event.first#.search_notif(search_params_of_filtr).compact.inject{|total, object| total & object.compact}.any?

#Search.all.each do |object|
#  search_params_of_filtr = object.attributes.except("id", "user_id", "created_at", "updated_at" ).map {|key, object| {"#{key}": object.to_s}}.reduce(:merge)
#
#  puts search_params_of_filtr
#  puts @event.search_notif(search_params_of_filtr).compact.inject{|total, object| total & object.compact}.any?
#
#
#  Notification.create(user_id: object.user.id, search_id: object.id, event_id: @event.id) if @event.search_notif(search_params_of_filtr).compact.inject{|total, object| total & object.compact}.any?
#end

#bb = Notification.create(user_id: 1, search_id: 3)
#puts bb.save

puts ap User.first
#@searches.compact.inject{|total, object| total & object.compact}.compact.map do |event2|
#  p
#    = Event.find(event2).title
#    ="  "
#    = link_to 'Show', Event.find(event2)

#p Event.search(data)
#p pp["search_start_beg"].to_s(:db).class
#p pp["search_start_beg"].to_s.class
#puts ap Event.first

#puts ap Search.last.user
