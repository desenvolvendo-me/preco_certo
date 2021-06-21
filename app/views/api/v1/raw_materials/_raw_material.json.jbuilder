json.extract! raw_material,
              :id,
              :name,
              :price,
              :icms,
              :ipi,
              :pis,
              :cofins,
              :created_at,
              :updated_at

json.url api_v1_raw_material_url(raw_material, format: :json)
