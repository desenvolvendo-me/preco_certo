# frozen_string_literal: true

class Company < ApplicationRecord
  validates :name, :cnpj, :tax_regime, presence: true

  enum tax_regime: ["simples nacional", "lucro presumido", "lucro real"]
end
