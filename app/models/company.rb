# frozen_string_literal: true

# == Schema Information
#
# Table name: companies
#
#  id                 :bigint(8)        not null, primary key
#  cnpj               :string
#  cofins             :float
#  icms               :float
#  ipi                :float
#  name               :string
#  payroll_percentage :float
#  phone              :string
#  pis                :float
#  tax_regime         :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#


class Company < ApplicationRecord
  has_many :expenses
  has_many :products

  validates :name, :cnpj, :tax_regime, presence: true

  enum tax_regime: ["simples nacional", "lucro presumido", "lucro real"]

  def calculate_total_expenses
    expenses.sum do |expense|
      expense.value.to_f
    end
  end
end
