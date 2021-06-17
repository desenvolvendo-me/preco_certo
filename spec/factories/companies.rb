FactoryBot.define do
  factory :company do
    name { "MyString" }
    tax_regime { 1 }
    phone { "MyString" }
    cnpj { "MyString" }
    icms { 1.5 }
    ipi { 1.5 }
    pis { 1.5 }
    cofins { 1.5 }
    payroll_percentage { 1.5 }
  end
end
