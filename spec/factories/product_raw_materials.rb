FactoryBot.define do
  factory :product_raw_material do
    consumption { 1.5 }
    raw_material_cost { 1.5 }
    product { create(:product) }
    raw_material { create(:raw_material) }
  end
end
