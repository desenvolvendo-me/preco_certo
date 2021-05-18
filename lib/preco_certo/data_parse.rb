# frozen_string_literal: true
require 'csv'

class DataParse
  attr_reader :file

  def initialize(file)
    @file = File.join(PrecoCerto.lib, file)
  end

  def parse!
    csv_data = CSV.read(file, col_sep: ";", headers: true)

    csv_data
  end
end
