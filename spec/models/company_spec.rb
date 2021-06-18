# frozen_string_literal: true

require "rails_helper"

RSpec.describe Company, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :cnpj }
    it { is_expected.to validate_presence_of :tax_regime }
  end

  describe "associations" do
    it { should have_many(:expenses) }
    it { should have_many(:products) }
  end

  context "calculates" do
    it "value total expenses" do
      company = create(:company)
      create_list(:expense, 5, value: 1.0, company: company)

      expect(company.calculate_total_expenses).to eq(5.0)
    end
  end
end