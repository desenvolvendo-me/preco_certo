# frozen_string_literal: true

require "rails_helper"

RSpec.describe Expense, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of :description }
    it { is_expected.to validate_presence_of :value }
  end

  describe "associations" do
    it { should belong_to(:company) }
  end
end
