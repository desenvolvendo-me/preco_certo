# frozen_string_literal: true

FactoryBot.define do
  factory :raw_material do
    name { "MyString" }
    price { 1.5 }
    icms { 1.5 }
    ipi { 1.5 }
    pis { 1.5 }
    cofins { 1.5 }
  end
end
