json.extract! opportunity, :id, :name, :author_id, :description, :requirements, :other, :deadline, :category, :created_at, :updated_at
json.url opportunity_url(opportunity, format: :json)
