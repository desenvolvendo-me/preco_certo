# frozen_string_literal: true

require_relative "preco_certo/version"

# Preco Certo module Gem
module PrecoCerto
  def self.root
    File.dirname __dir__
  end

  def self.lib
    File.join(root, "lib")
  end
end
