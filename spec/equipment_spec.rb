# frozen_string_literal: true

require "date"

RSpec.describe "Equipment" do
  csv_path = "lib/preco_certo/storage/equipments.csv"

  before do
    stub_const("Equipment::CSV_PATH", csv_path)
    restart_csv(csv_path)
  end

  after(:all) { restart_csv(csv_path) }

  it "create" do
    equipment = Equipment.create("compreensor", "01/01/2021", 180_000_00, 10)

    expect(equipment.description).to eq("compreensor")
    expect(equipment.aquisition_date).to eq("01/01/2021")
    expect(equipment.value).to eq(180_000_00)
    expect(equipment.annual_percent).to eq(10)
  end

  it "calculate actual value of the equipment" do
    equipment_value = 180000.00
    annual_percent = 10
    aquisition_date = Date.parse("01/01/2021")
    today = Date.parse("31/12/2021")
    total_days_of_year = 365

    value_per_year = sprintf("%.2f", equipment_value / (100 / annual_percent) / total_days_of_year).to_f

    days_between_today_and_aquisition_date = (today - aquisition_date).to_i
    actual_value_equipment = equipment_value - (days_between_today_and_aquisition_date * value_per_year)

    expect(162047.52).to eq(actual_value_equipment)
  end

  def restart_csv(file_path)
    CSV.open(file_path, "wb", col_sep: ";") do |csv|
      csv << %w[id description aquisition_date value annual_percentage]
    end
  end
end
