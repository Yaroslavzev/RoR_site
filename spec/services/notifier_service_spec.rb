# frozen_string_literal: true

describe NotifierService do
  let(:time)    { Time.current }
  let(:event)   { create :event, date_from: time, date_to: time + 5.days }
  let!(:search) do
    create :search, search_start_beg: time - 1.day,
                    search_start_end: time + 1.day,
                    search_place: nil,
                    search_subject: nil
  end
  context "#call" do
    it "returns search results" do
      NotifierService.call(event)

      expect(Notification.all.count).to be 1
    end
  end
end
