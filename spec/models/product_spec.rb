# frozen_string_literal: true

require "rails_helper"

RSpec.describe Product, type: :model do
  describe "associations" do
    it { should belong_to(:company) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of :description }
    it { is_expected.to validate_presence_of :unity }
  end
end
