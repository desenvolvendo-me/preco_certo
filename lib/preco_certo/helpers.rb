# frozen_string_literal: true

# Class Helper
class Helper
  def self.time_sex_to_time_hex(tempo)
    arr = tempo.split(":")
    (arr[0].to_i * 60) + arr[1].to_i + ((arr[2].to_i / 0.6) / 100).round(2)
  end
end
