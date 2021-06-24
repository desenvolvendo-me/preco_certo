# frozen_string_literal: true

require "rails_helper"

RSpec.describe ProductGoal, type: :model do
  describe "associations" do
    it { should belong_to(:product) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of :monthly_goal }
  end
end
