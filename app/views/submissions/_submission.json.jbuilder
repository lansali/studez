json.extract! submission, :id, :opportunity_id, :student_id, :resume_id, :cover_letter, :created_at, :updated_at
json.url submission_url(submission, format: :json)
