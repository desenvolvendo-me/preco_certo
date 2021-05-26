# frozen_string_literal: true

RSpec.describe "Expense" do
  let(:expenses) { Expense.expenses }

  it "create expense" do
    expense = Expense.create(10, "agua", "100,00")

    expect(expense.id).to eq(10)
    expect(expense.description).to eq("agua")
    expect(expense.value).to eq("100,00")
  end

  it "get all expenses" do
    expect(expenses.length).to eq(5)
  end

  it "get first expense" do
    expect(expenses.first["id"]).to eq("1")
    expect(expenses.first["description"]).to eq("aluguel")
    expect(expenses.first["value"]).to eq("1500,00")
  end

  it "calculate total expenses" do
    expect(Expense.calculate_total).to eq(2955.00)
  end
end
