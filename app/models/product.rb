# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :company

  validates :description, :unity, presence: true
end
