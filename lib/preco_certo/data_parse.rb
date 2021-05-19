# frozen_string_literal: true

require "csv"

# Class to parse CSV
class DataParse
  attr_reader :file

  def initialize(file)
    @file = File.join(PrecoCerto.lib, file)
  end

  def parse!
    CSV.read(file, options)
  end

  def options
    { col_sep: ";", headers: true }
  end
end
