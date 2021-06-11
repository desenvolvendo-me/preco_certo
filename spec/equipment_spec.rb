# frozen_string_literal: true

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
    allow(Date).to receive(:today).and_return(Date.new(2021, 12, 31))
    equipment = Equipment.create("compreensor", "01/01/2021", 180_000_00, 10)

    expect(equipment.current_value).to eq(162_051_16)
  end

  it "calculate deprecation month of the equipment" do
    equipment = Equipment.create("compreensor", "01/01/2021", 180_000_00, 10)
    expect(equipment.deprecation_month).to eq(1_500_00)
  end

  it "list all equipments" do
    Equipment.create("Serra Elétrica", "12/03/2021", 2500, 3)
    Equipment.create("Furadeira", "21/02/2021", 1200, 2)
    Equipment.create("Serra Fita", "19/04/2021", 5650, 20)
    equipments = Equipment.all

    expect(equipments.length).to eq(3)
  end

  it "calculate total deprecation all equipments" do
    deprecation_values = []
    deprecation_values.push(Equipment.create("Serra Elétrica", "12/03/2021", 2500, 3).deprecation_month)
    deprecation_values.push(Equipment.create("Furadeira", "21/02/2021", 1200, 2).deprecation_month)
    deprecation_values.push(Equipment.create("Serra Fita", "19/04/2021", 5650, 20).deprecation_month)

    expect(deprecation_values.sum).to eq(102.48)
  end

  def restart_csv(file_path)
    CSV.open(file_path, "wb", col_sep: ";") do |csv|
      csv << %w[id description aquisition_date value annual_percent]
    end
  end
end
