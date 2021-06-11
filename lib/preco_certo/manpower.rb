# frozen_string_literal: true

require "preco_certo/data_parse"

# class Product, CSV product
class ManPower
  attr_accessor :id_manpower, :description, :time

  def initialize(id_manpower, description, time)
    @id_manpower = id_manpower
    @description = description
    @time = time
  end

  def self.all
    data_parse = DataParse.new("preco_certo/storage/manpower.csv").parse!
    data_parse.map do |line|
      ManPower.new(
        line["id_manpower"],
        line["description"],
        line["time"]
      )
    end
  end

  def self.create(id_manpower, description, time)
    ManPower.new(id_manpower, description, time)
  end
end
