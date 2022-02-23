# == Schema Information
#
# Table name: production_goals
#
#  id           :bigint(8)        not null, primary key
#  monthly_goal :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  product_id   :bigint(8)        not null
#
# Indexes
#
#  index_production_goals_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#

class ProductionGoal < ApplicationRecord
  belongs_to :product
  validates  :monthly_goal, presence: true
end
