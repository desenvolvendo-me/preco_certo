# frozen_string_literal: true

require "preco_certo/data_parse"

# class Expense, CSV expense
class Expense
  attr_accessor :id, :description, :value

  def initialize(id, description, value)
    @id = id
    @description = description
    @value = value
  end

  def self.expenses
    data_parse = DataParse.new("preco_certo/storage/expense.csv").parse!
    data_parse.each do |line|
      Expense.new(
        line["id"],
        line["description"],
        line["value"]
      )
    end
  end

  def self.create(id, descricao, value)
    Expense.new(id, descricao, value)
  end

  def self.calculate_total
    expenses.sum do |expense|
      expense["value"].to_f
    end
  end
end
