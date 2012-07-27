
FactoryGirl.define do
  factory :interview, :class => Refinery::Interviews::Interview do
    sequence(:people_name) { |n| "refinery#{n}" }
  end
end

