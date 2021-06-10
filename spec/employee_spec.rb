# frozen_string_literal: true

RSpec.describe "Employee" do
  describe "GET employees" do
    let(:employees) { Employee.all }

    it "check csv headers" do
      headers = CSV.open("lib/preco_certo/storage/employees.csv", col_sep: ";", &:readline)

      expect(headers.length).to eq(5)
      expect(headers).to eq(%w[id name salary work_time id_function])
    end

    it "verify length employees" do
      expect(employees.length).to eq(5)
    end

    it "get first employee" do
      expect(employees.first.id).to eq("1")
      expect(employees.first.name).to eq("Luciano Paulista")
      expect(employees.first.salary).to eq(1700.00)
      expect(employees.first.work_time).to eq(220)
      expect(employees.first.id_function).to eq("1")
    end
  end

  it "create employee" do
    employee = Employee.create(10, "José", "1500,00", 200, 1)

    expect(employee.id).to eq(10)
    expect(employee.name).to eq("José")
    expect(employee.salary).to eq(1500.00)
    expect(employee.work_time).to eq(200)
    expect(employee.id_function).to eq(1)
  end

  it "calculate minute cost of first employee with company_id 1" do
    employee = Employee.all.first
    cost = employee&.minute_cost("1")

    expect(cost).to be_within(0.001).of(0.1416)
  end
end
