json.array!(@subjects) do |subject|
  json.extract! subject, :id, :title, :objective, :description, :accept_token, :user_id
  json.url subject_url(subject, format: :json)
end
