# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name      { FFaker::Internet.user_name[0...16] }
    email     { FFaker::Internet.safe_email }
    password  { "password" }
  end

  factory :event do
    title        { FFaker::Conference.name }
    body         { Array.new(rand(4...6)) { FFaker::HipsterIpsum.sentence(2) } }
    user         { create :user }
    place        { FFaker::Venue.name }
    date_from    { FFaker::Time.between(Time.current, Time.current + 5.days) }
    date_to      { FFaker::Time.between(Time.current + 6, Time.current + 10.days) }
  end

  factory :search do
    user                { create :user }
    search_place        { FFaker::Venue.name }
    search_subject      { FFaker::HipsterIpsum.sentence(2) }
    search_start_beg    { FFaker::Time.between(Time.current, Time.current + 5.days) }
    search_start_end    { FFaker::Time.between(Time.current + 6, Time.current + 10.days) }
  end
end
