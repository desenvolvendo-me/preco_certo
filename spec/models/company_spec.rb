require 'rails_helper'

RSpec.describe Company, type: :model do
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :cnpj }
  it { is_expected.to validate_presence_of :tax_regime }
end
