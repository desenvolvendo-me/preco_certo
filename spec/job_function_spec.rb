# frozen_string_literal: true

RSpec.describe "JobFunction" do
  it "creates a job function" do
    job = JobFunction.create(10, "Pintor")

    expect(job.description).to eq("Pintor")
    expect(job.id).to eq(10)
  end
end
