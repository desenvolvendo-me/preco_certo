json.extract! expense, :id, :description, :value, :created_at, :updated_at
json.url api_v1_expense_url(expense, format: :json)
