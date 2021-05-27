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

  def self.create(id_markup, description, profit, commission, shipping, marketing, icms, ipi, pis, cofins)
    Markup.new(id_markup, description, profit, commission, shipping, marketing, icms, ipi, pis, cofins)
  end
end
