FactoryBot.define do
  factory :contract do
    active     { true }
    start_date { '01-01-2021'.to_date }
    end_date   { '31-12-2021'.to_date }
    c_type     { 0 }
    coverage   { 10 }
    premium    { 100 }
    renewable  { false }

    customer
  end
end
