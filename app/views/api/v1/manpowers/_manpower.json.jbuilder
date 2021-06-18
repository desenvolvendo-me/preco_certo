json.extract! manpower,
              :id,
              :description,
              :time_hex,
              :created_at,
              :updated_at
json.url api_v1_manpower_url(manpower, format: :json)
