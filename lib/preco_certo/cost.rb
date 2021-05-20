# frozen_string_literal: true

require "preco_certo/data_parse"

# class Cost, CSV cost
class Cost
  attr_accessor :id, :description, :value

  def initialize(id, description, value)
    @id = id
    @description = description
    @value = value
  end

  def self.costs
    data_parse = DataParse.new("preco_certo/storage/costs.csv").parse!
    data_parse.each do |line|
      Cost.new(
        line["id"],
        line["description"],
        line["value"]
      )
    end
  end

  def self.create(id, descricao, value)
    Cost.new(id, descricao, value)
  end
end
