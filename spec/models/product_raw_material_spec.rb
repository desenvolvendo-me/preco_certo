# frozen_string_literal: true

require "rails_helper"

RSpec.describe ProductRawMaterial, type: :model do
  describe "associations" do
    it { should belong_to(:product) }
    it { should belong_to(:raw_material) }
  end
end
