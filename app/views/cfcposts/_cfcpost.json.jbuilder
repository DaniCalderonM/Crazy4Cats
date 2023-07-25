json.extract! cfcpost, :id, :image, :description, :cfcuser_id, :created_at, :updated_at
json.url cfcpost_url(cfcpost, format: :json)
