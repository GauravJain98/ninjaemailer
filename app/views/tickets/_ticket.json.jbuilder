json.extract! ticket, :id, :email, :text, :agent_id, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
