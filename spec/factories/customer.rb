FactoryBot.define do
  factory :customer do
    name { "John Doe" }
    payment_details  { "credit card ### - Other Important Details" }
  end
end
