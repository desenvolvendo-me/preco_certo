# frozen_string_literal: true

# == Schema Information
#
# Table name: products
#
#  id          :bigint(8)        not null, primary key
#  description :string
#  unity       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  company_id  :bigint(8)        not null
#
# Indexes
#
#  index_products_on_company_id  (company_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#


class Product < ApplicationRecord
  belongs_to :company
  has_many :product_raw_materials

  validates :description, :unity, presence: true
end
