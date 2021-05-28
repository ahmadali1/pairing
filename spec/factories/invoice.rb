FactoryBot.define do
  factory :invoice do
    amount  { 100 }
    date    { '01-01-2020'.to_date }
    is_paid { true }
    payment_details   { "credit card ### - Other Important Details" }

    contract
  end
end
