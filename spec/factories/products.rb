# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    description { "MyString" }
    unity { "MyString" }
    company { create(:company) }
  end
end
