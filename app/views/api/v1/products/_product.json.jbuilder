json.extract! product, :id, :description, :unity, :company_id, :created_at, :updated_at
json.url api_v1_product_url(product, format: :json)
