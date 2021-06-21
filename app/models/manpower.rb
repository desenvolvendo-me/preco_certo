class Manpower < ApplicationRecord
  validates :description, :time_hex, presence: true
end
