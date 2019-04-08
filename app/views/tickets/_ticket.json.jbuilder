json.extract! ticket, :id, :title, :text, :agent, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
