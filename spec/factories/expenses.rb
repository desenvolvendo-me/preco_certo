FactoryBot.define do
  factory :expense do
    description { "água" }
    value { 150.5 }
    company { create(:company) }
  end
end
