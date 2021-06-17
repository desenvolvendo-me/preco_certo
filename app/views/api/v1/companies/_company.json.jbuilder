json.extract! company,
              :id,
              :name,
              :tax_regime,
              :phone,
              :icms,
              :ipi,
              :pis,
              :cofins,
              :payroll_percentage,
              :created_at,
              :updated_at

json.url api_v1_company_url(company, format: :json)
