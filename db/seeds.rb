# frozen_string_literal: true

company = Company.create!(
  name: "Ford",
  phone: "123112231",
  cnpj: "12391919123123",
  tax_regime: 1,
  icms: 2.0,
  ipi: 5,
  pis: 1,
  cofins: 3.5,
  payroll_percentage: 5.9
)

# Create Expenses
Expense.create!(
  description: "Agua",
  value: 150,
  company: company
)

Expense.create!(
  description: "Luz",
  value: 150.0,
  company: company
)
