# frozen_string_literal: true

class JobFunction < ApplicationRecord
  validates :description, presence: true
end
