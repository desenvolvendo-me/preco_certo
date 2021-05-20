# frozen_string_literal: true

require "preco_certo/company"

RSpec.describe "Company" do
  let!(:company) { Company.new("preco_certo/storage/companies.csv") }

  it "create a company" do
    name = "empresa5"
    tax_regime = "real_profit"
    phone = "8655559696"
    cnpj = "52744494000112"
    id = 6

    company.create(id, name, tax_regime, phone, cnpj)

    companies = company.companies
    created_company = companies[companies.length - 1]

    expect(created_company["name"]).to eq(name)
    expect(created_company["tax_regime"]).to eq(tax_regime)
    expect(created_company["phone"]).to eq(phone)
    expect(created_company["cnpj"]).to eq(cnpj)
  end
end
