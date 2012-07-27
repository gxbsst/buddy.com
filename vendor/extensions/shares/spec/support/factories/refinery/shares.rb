
FactoryGirl.define do
  factory :share, :class => Refinery::Shares::Share do
    sequence(:people_name) { |n| "refinery#{n}" }
  end
end

