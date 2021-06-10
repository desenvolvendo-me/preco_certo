# frozen_string_literal: true

# class Employee
class Employee
  attr_reader :id, :name, :salary, :work_time, :id_function

  def initialize(id, name, salary, work_time, id_function)
    @id = id
    @name = name
    @salary = salary.to_f
    @work_time = work_time.to_i
    @id_function = id_function
  end

  def self.all
    data_parse = DataParse.new("preco_certo/storage/employees.csv").parse!
    data_parse.map do |line|
      Employee.new(
        line["id"],
        line["name"],
        line["salary"],
        line["work_time"],
        line["id_function"]
      )
    end
  end

  def minute_cost(company_id)
    company_payroll_percentage = 0

    DataParse.new("preco_certo/storage/companies.csv").parse!.each do |line|
      company_payroll_percentage = line["payroll_percentage"].to_f if line["id"] == company_id
    end

    taxes = salary * company_payroll_percentage / 100

    (salary + taxes) / work_time / 60
  end

  def self.create(id, name, salary, work_time, id_function)
    Employee.new(id, name, salary, work_time, id_function)
  end
end
