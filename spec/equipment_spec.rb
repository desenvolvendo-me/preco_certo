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
    equipment = Equipment.create("compreensor", "01/01/2021", 180_000_00, 10)
    actual_value_equipment = Equipment.calculate_actual_value(equipment, "31/12/2021")
    expect(actual_value_equipment).to eq(162_051_16)
  end

  def restart_csv(file_path)
    CSV.open(file_path, "wb", col_sep: ";") do |csv|
      csv << %w[id description aquisition_date value annual_percentage]
    end
  end
end
