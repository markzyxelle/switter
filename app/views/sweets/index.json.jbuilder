json.array!(@sweets) do |sweet|
  json.extract! sweet, :id, :user_id, :parent_id, :message
  json.url sweet_url(sweet, format: :json)
end
