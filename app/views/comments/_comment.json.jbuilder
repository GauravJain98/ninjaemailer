json.extract! comment, :id, :comment, :sender, :ticket, :created_at, :updated_at
json.url comment_url(comment, format: :json)
