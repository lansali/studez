json.extract! opportunity, :id, :name, :business_id, :description, :location, :requirements, :other, :deadline, :category, :created_at, :updated_at
json.url opportunity_url(opportunity, format: :json)
