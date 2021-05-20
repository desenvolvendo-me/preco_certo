# frozen_string_literal: true

require "preco_certo/data_parse"

# class Employee
class Employee
  attr_accessor :name, :salary, :work_time
  attr_reader :id

  def initialize(id, name, salary, work_time)
    @id = id
    @name = name
    @salary = salary
    @work_time = work_time
  end

  def self.all
    data_parse = DataParse.new("preco_certo/storage/employees.csv").parse!
    data_parse.each do |line|
      Employee.new(
        line["id"],
        line["name"],
        line["salary"],
        line["work_time"]
      )
    end
  end

  def self.create(id, name, salary, work_time)
    Employee.new(id, name, salary, work_time)
  end
end
