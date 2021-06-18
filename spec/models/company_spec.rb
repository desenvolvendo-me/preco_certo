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

end
