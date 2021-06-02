# frozen_string_literal: true

require "csv"

class Equipment
  ID_RANDOM_SET = 2000
  CSV_PATH = "lib/preco_certo/storage/equipments.csv"

  attr_reader :id, :description, :aquisition_date, :value, :annual_percentage

  def initialize(id, description, aquisition_date, value, annual_percentage)
    @id = id
    @description = description
    @aquisition_date = aquisition_date
    @value = value
    @annual_percentage = annual_percentage
  end

  def self.create(description, aquisition_date, value, annual_percentage)
    id = rand(ID_RANDOM_SET)
    equipment = Equipment.new(id, description, aquisition_date, value, annual_percentage)

    CSV.open(CSV_PATH, "ab") do |csv|
      csv << [equipment.id, equipment.description, equipment.aquisition_date, equipment.value, equipment.annual_percentage]
    end

    equipment
  end

end
