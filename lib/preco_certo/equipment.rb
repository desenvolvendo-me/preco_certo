# frozen_string_literal: true

require "csv"

class Equipment
  ID_RANDOM_SET = 2000
  CSV_PATH = "lib/preco_certo/storage/equipments.csv"

  attr_reader :id, :description, :aquisition_date, :value, :annual_percent

  def initialize(id, description, aquisition_date, value, annual_percent)
    @id = id
    @description = description
    @aquisition_date = aquisition_date
    @value = value
    @annual_percent = annual_percent
  end

  def self.create(description, aquisition_date, value, annual_percent)
    id = rand(ID_RANDOM_SET)
    equipment = Equipment.new(id, description, aquisition_date, value, annual_percent)

    CSV.open(CSV_PATH, "ab") do |csv|
      csv << [equipment.id, equipment.description, equipment.aquisition_date, equipment.value, equipment.annual_percent]
    end

    equipment
  end

end
