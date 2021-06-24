# frozen_string_literal: true

FactoryBot.define do
  factory :production_goal do
    product { create(:product) }
    monthly_goal { 1 }
  end
end
