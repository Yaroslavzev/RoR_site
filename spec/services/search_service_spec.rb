# frozen_string_literal: true

describe SearchService do
  let(:time) { Time.current }
  let!(:events) do 
    create :event, date_from: time, date_to: time + 5.days
    create :event, date_from: time - 2.days , date_to: time + 5.days
  end
  
  let(:search_params) do
    {
      search_start_beg: time - 1.days,
      search_start_end: time,
      search_subjects: "",
      search_place: "",
    }
  end
  
  context "#call" do
  it "returns search results" do
     expect(SearchService.call(search_params).count).to be 1
   end
 end
end