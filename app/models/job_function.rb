# frozen_string_literal: true

# == Schema Information
#
# Table name: job_functions
#
#  id          :bigint(8)        not null, primary key
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#


class JobFunction < ApplicationRecord
  validates :description, presence: true
end
