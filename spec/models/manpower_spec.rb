# frozen_string_literal: true

require "rails_helper"

RSpec.describe Manpower, type: :model do
  it { is_expected.to validate_presence_of :description }
  it { is_expected.to validate_presence_of :time_hex }
end
