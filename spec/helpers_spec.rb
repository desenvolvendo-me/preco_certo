# frozen_string_literal: true

RSpec.describe "Helpers" do
  it "time_sex_to_time_hex" do
    timehex = Helper.time_sex_to_time_hex("00:01:30")
    expect(timehex).to eq(1.5)
  end
  it "time_sex_to_time_hex" do
    timehex = Helper.time_sex_to_time_hex("00:01:45")
    expect(timehex).to eq(1.75)
  end
end
