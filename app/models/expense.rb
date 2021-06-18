# frozen_string_literal: true

class Expense < ApplicationRecord
  belongs_to :company

  validates :description, :value, presence: true
end
