# frozen_string_literal: true

require "csv"

# Class Equipment
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

    CSV.open(CSV_PATH, "ab", col_sep: ";") do |csv|
      csv << [equipment.id, equipment.description, equipment.aquisition_date, equipment.value, equipment.annual_percent]
    end

    equipment
  end

  def self.all
    equipments = []

    CSV.read(CSV_PATH, headers: true, col_sep: ";").each do |row|
      equipments << Equipment.new(row["id"], row["description"],
                                  row["aquisition_date"], row["value"], row["annual_percent"])
    end

    equipments
  end

  def current_value
    today = Date.today
    aquisited_date = Date.parse(aquisition_date)
    total_days_of_year = 365

    value_per_year = format("%.2f", value / (100 / annual_percent) / total_days_of_year)
    days_diff = (today - aquisited_date).to_i

    value - (days_diff * value_per_year.to_f)
  end

  def deprecation_month
    percent = format("%.2f", 100 / annual_percent.to_f).to_f
    per_month = (percent * 12).to_f
    format("%.2f", value.to_f / per_month.to_f).to_f
  end

  def self.total_deprecation
    deprecation_values = []
    equipments = Equipment.all
    equipments.each { |equipment| deprecation_values.push(equipment.deprecation_month) }
    deprecation_values.sum
  end
end
