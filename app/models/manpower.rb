# == Schema Information
#
# Table name: manpowers
#
#  id          :bigint(8)        not null, primary key
#  description :string
#  time_hex    :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Manpower < ApplicationRecord
  validates :description, :time_hex, presence: true
end
