# frozen_string_literal: true

# class JobFunction
class JobFunction
  attr_reader :id, :description

  def initialize(id, description)
    @id = id
    @description = description
  end

  def self.create(id, description)
    JobFunction.new(id, description)
  end
end
