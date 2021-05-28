FactoryBot.define do
  factory :contract_log do
    adjusted_at { '30-06-2021' }
    previous_premium { 100 }
    reason { 'some reason' }

    contract
  end
end
