class ProductionGoal < ApplicationRecord
  belongs_to :product
  validates  :monthly_goal, presence: true
end
