# frozen_string_literal: true

class Company < ApplicationRecord
  has_many :expenses
  has_many :products

  validates :name, :cnpj, :tax_regime, presence: true

  enum tax_regime: ["simples nacional", "lucro presumido", "lucro real"]
end
