# frozen_string_literal: true

require "preco_certo/data_parse"

# class Markup, CSV Markup
class Markup
  attr_reader :id_markup, :description, :profit, :commission, :shipping, :marketing, :icms, :ipi, :pis, :cofins

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

  def self.all
    data_parse = DataParse.new("preco_certo/storage/markup.csv").parse!
    data_parse.map do |line|
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

  def self.taxes(subject)
    subject.icms.to_f + subject.ipi.to_f + subject.pis.to_f + subject.cofins.to_f
  end

  def self.calculate_index(id_markup, company_id = nil)
    markup = all.find { |mark| mark.id_markup == id_markup }
    calc = markup.profit.to_f + markup.commission.to_f + markup.shipping.to_f + markup.marketing.to_f

    if company_id
      company = Company.all.find { |comp| comp.id == company_id }
      indice = taxes(company)
    else
      indice = taxes(markup)
    end

    (100 / (100 - (indice + calc))).round(8)
  end

  def self.create(id_markup, description, profit, commission, shipping, marketing, icms, ipi, pis, cofins)
    Markup.new(id_markup, description, profit, commission, shipping, marketing, icms, ipi, pis, cofins)
  end
end
