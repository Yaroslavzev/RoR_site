# frozen_string_literal: true

describe NotifierService do
  let(:time)    { Time.current }
  let(:event)   { create :event, date_from: time, date_to: time + 5.days }
  
  let!(:search) { create :search, search_start_beg: time - 1.days, search_start_end: time + 1.days, search_place: nil, search_subject: nil }
  
  context "#call" do
   it "returns search results" do
     NotifierService.call(event)

     expect(Notification.all.count).to be 1
   end
 end
end