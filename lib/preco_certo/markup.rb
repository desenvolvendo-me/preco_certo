# frozen_string_literal: true

require "preco_certo/data_parse"

# class Markup, CSV Markup
class Markup
  attr_accessor :id_markup, :description, :profit, :commission, :shipping, :marketing, :icms, :ipi, :pis, :cofins

  def initialize(id_markup, description, profit, commission, shipping, marketing, icms, ipi, pis, cofins)
    @id_markup = id_markup
    @description = description
    @profit = profit
    @commission = commission
    @shipping = shipping
    @marketing = marketing
    @icms = icms
    @ipi = ipi
    @pis = pis
    @cofins = cofins
  end

  def self.markup
    data_parse = DataParse.new("preco_certo/storage/markup.csv").parse!
    data_parse.each do |line|
      Markup.new(
        line["id_markup"],
        line["description"],
        line["profit"],
        line["commission"],
        line["shipping"],
        line["marketing"],
        line["icms"],
        line["ipi"],
        line["pis"],
        line["cofins"]
      )
    end
  end

  def self.calculate_index(id_markup)
    data_parse = DataParse.new("preco_certo/storage/markup.csv").parse!
    indice = 0.00
    # verificar melhor maneira de filtrar o array
    data_parse.each do |line|
      indice = line["profit"].to_f + line["commission"].to_f + line["shipping"].to_f + line["marketing"].to_f + line["icms"].to_f + line["ipi"].to_f + line["pis"].to_f + line["cofins"].to_f if line["id_markup"] == id_markup
    end
    (100/(100-indice)).round(8)
  end

  def self.create(id_markup, description, profit, commission, shipping, marketing, icms, ipi, pis, cofins)
    Markup.new(id_markup, description, profit, commission, shipping, marketing, icms, ipi, pis, cofins)
  end
end
