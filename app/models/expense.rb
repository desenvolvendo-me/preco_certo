# frozen_string_literal: true

# == Schema Information
#
# Table name: expenses
#
#  id          :bigint(8)        not null, primary key
#  description :string
#  value       :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  company_id  :bigint(8)        not null
#
# Indexes
#
#  index_expenses_on_company_id  (company_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#


class Expense < ApplicationRecord
  belongs_to :company

  validates :description, :value, presence: true
end
