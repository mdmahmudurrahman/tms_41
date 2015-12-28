require "faker"

FactoryGirl.define do

  factory :course do
    name Faker::Lorem.word
    description Faker::Lorem.sentence
    start_date Faker::Time.between(2.years.ago, 1.year.ago)
    end_date Faker::Time.between(1.year.ago, 1.week.ago)
    status Course.statuses[:open]
    factory :invalid_course do
      name nil
    end
  end
end