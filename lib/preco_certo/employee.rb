# frozen_string_literal: true

# class Employee
class Employee
  attr_accessor :name, :salary, :work_time, :id_function
  attr_reader :id

  def initialize(id, name, salary, work_time, id_function)
    @id = id
    @name = name
    @salary = salary
    @work_time = work_time
    @id_function = id_function
  end

  def self.all
    data_parse = DataParse.new("preco_certo/storage/employees.csv").parse!
    data_parse.each do |line|
      Employee.new(
        line["id"],
        line["name"],
        line["salary"],
        line["work_time"],
        line["id_function"]
      )
    end
  end

  def self.calculate_minute_cost(id, company_id)
    employees_csv = DataParse.new("preco_certo/storage/employees.csv").parse!
    company_payroll_percentage = 0

    DataParse.new("preco_certo/storage/companies.csv").parse!.each do |line|
      company_payroll_percentage = line["payroll_percentage"].to_f if line["id"] == company_id
    end

    employees_csv.each do |line|
      if line["id"] == id
        taxes = line["salary"].to_f * company_payroll_percentage / 100
        return ((line["salary"].to_f + taxes) / line["work_time"].to_i) / 60
      end
    end
  end

  def self.create(id, name, salary, work_time, id_function)
    Employee.new(id, name, salary, work_time, id_function)
  end
end
